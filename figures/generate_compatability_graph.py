#! /usr/bin/python
import os
from math import log
import sys

min_rtt = 100

def log_parse(file_name, desired, min_rtt):
  fh = open(file_name, "r");
  delays = []
  tpts = []
  tuple_list = []
  for line in fh.readlines():
    records = line.split()
    tpt = float(records[1].split("=")[1])
    delay = log(float(records[3].split("=")[1]) - min_rtt)/log(2)
    fid = records[0].split(":")[0]
    if (fid != desired and desired != "*"):
      continue
    else :
      tuple_list += [(delay, tpt)]
      delays += [delay]
      tpts   += [tpt]
  
  delays.sort()
  tpts.sort()
  del_med = delays[int(round(0.5 * len(delays)))]
  tpt_med = tpts[int(round(0.5 * len(tpts)))]
  return (del_med, tpt_med, tuple_list)

def process_file(file_name, desired, min_rtt, output_tag):
  print "Processing ", file_name
  (del_med, tpt_med, tuple_list) = log_parse(file_name, desired, min_rtt)

  # Write to two distinct files
  fh = open("/tmp/tmp", "w");
  for record in tuple_list:
    for item in record:
      fh.write(str(item) + " ")
    fh.write("\n")
  fh.close() 

  os.system("cat /tmp/tmp | ./ellipsemaker > " + output_tag + ".ellipse");
  fh = open(output_tag + ".meds" , "w");
  fh.write(str(del_med) + " " + str(tpt_med)+ "\n");
  fh.close()

# Independent
process_file("withoutnewreno/baseline.alwayson",   "*", min_rtt, "homogenous-baseline-alwayson");
process_file("withoutnewreno/compatible.alwayson", "*", min_rtt, "homogenous-tcpcompatible-alwayson");
process_file("withoutnewreno/newreno.alwayson",    "*", min_rtt, "homogenous-newreno-alwayson");

# With TCP
process_file("withnewreno/baseline.alwayson", "0", min_rtt, "baseline-alwayson-vs-newreno");
process_file("withnewreno/baseline.alwayson", "1", min_rtt, "newreno-vs-baseline-alwayson");
process_file("withnewreno/compatible.alwayson", "0", min_rtt, "tcpcompatible-alwayson-vs-newreno");
process_file("withnewreno/compatible.alwayson", "1", min_rtt, "newreno-vs-tcpcompatible-alwayson");

fh = open("diversity_graph.p", "w");
fh.write("set term svg\n");
fh.write("unset key\n");
fh.write("set xlabel \"Queueing delay (ms)\"\n");
fh.write("set ylabel \"Throughput (Mbps)\"\n");
max_exp = 8
fh.write("set yrange [3:7]\n");
fh.write("set xrange [" + str(log(16)/log(2)) + ":" + str(log(2**max_exp)/log(2)) + "]" + " reverse \n");
ticstr = "set xtics("
for i in range(0, max_exp):
  ticstr += "\"" + str(2 ** i) + "\"" + " " + str(i) + ","
ticstr   += "\"" + str(2 ** max_exp) + "\"" + " " + str(max_exp) + ")"
print ticstr
fh.write(ticstr + "\n")

fh.write("""
set output "compatible-reference.svg"
plot "homogenous-baseline-alwayson.ellipse" w lines lw 2 linecolor rgb "red",   \
     "homogenous-tcpcompatible-alwayson.ellipse" w lines lw 2 linecolor rgb "blue", \
     "homogenous-newreno-alwayson.ellipse" w lines lw 2 linecolor rgb "green",    \
     \
     "homogenous-baseline-alwayson.meds" w points lw 2 lt 2 linecolor rgb "red",   \
     "homogenous-tcpcompatible-alwayson.meds" w points lw 2 lt 2 linecolor rgb "blue", \
     "homogenous-newreno-alwayson.meds" w points lw 2 lt 2 linecolor rgb "green"

set output "compatible-cross.svg"
plot "baseline-alwayson-vs-newreno.ellipse" w lines lw 2 linecolor rgb "red",   \
     "tcpcompatible-alwayson-vs-newreno.ellipse" w lines lw 2 linecolor rgb "blue", \
     "newreno-vs-baseline-alwayson.ellipse" w lines lw 2 linecolor rgb "green" title "newreno vs baseline",  \
     "newreno-vs-tcpcompatible-alwayson.ellipse" w lines lw 2 linecolor rgb "green" title "newreno vs compatible", \
     \
     "baseline-alwayson-vs-newreno.meds" w points lw 2 lt 2 linecolor rgb "red",   \
     "tcpcompatible-alwayson-vs-newreno.meds" w points lw 2 lt 2 linecolor rgb "blue", \
     "newreno-vs-baseline-alwayson.meds" w points lw 2 lt 2 linecolor rgb "green",  \
     "newreno-vs-tcpcompatible-alwayson.meds" w points lw 2 lt 2 linecolor rgb "green"

""");
fh.close()

os.system("gnuplot diversity_graph.p");
