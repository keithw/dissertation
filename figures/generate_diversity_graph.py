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
process_file("independent-homogenous/delta-0.1.2senders", "*", min_rtt, "independent-homogenous-delta-0.1");
process_file("independent-homogenous/delta-10.0.2senders", "*", min_rtt, "independent-homogenous-delta-10.0");

# Coevolved
process_file("coevolved-homogenous/coevolved-delta-0.1.2senders", "*", min_rtt, "coevolved-homogenous-delta-0.1");
process_file("coevolved-homogenous/coevolved-delta-10.0.2senders", "*", min_rtt, "coevolved-homogenous-delta-10.0");
process_file("coevolved-heterogenous/coevolved-2senders", "0", min_rtt, "coevolved-heterogenous-delta-0.1");
process_file("coevolved-heterogenous/coevolved-2senders", "1", min_rtt, "coevolved-heterogenous-delta-10.0");

fh = open("diversity_graph.p", "w");
fh.write("set term svg\n");
fh.write("set xlabel \"Queueing delay (ms)\"\n");
fh.write("set ylabel \"Throughput (Mbps)\"\n");
max_exp = 11
fh.write("set yrange [5:11]\n");
fh.write("set xrange [" + str(log(1)/log(2)) + ":" + str(log(2**max_exp)/log(2)) + "]" + " reverse \n");
ticstr = "set xtics("
for i in range(0, max_exp):
  ticstr += "\"" + str(2 ** i) + "\"" + " " + str(i) + ","
ticstr   += "\"" + str(2 ** max_exp) + "\"" + " " + str(max_exp) + ")"
print ticstr
fh.write(ticstr + "\n")

fh.write("""
set output "diversity-reference.svg"
plot "independent-homogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "red",   \
     "independent-homogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "blue", \
     "coevolved-homogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "black",    \
     "coevolved-homogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "brown",   \
     "coevolved-heterogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "green",  \
     "coevolved-heterogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "yellow", \
     \
     "independent-homogenous-delta-0.1.meds" w points lw 2 linecolor rgb "red",   \
     "independent-homogenous-delta-10.0.meds" w points lw 2 linecolor rgb "blue", \
     "coevolved-homogenous-delta-0.1.meds" w points lw 2 linecolor rgb "black",    \
     "coevolved-homogenous-delta-10.0.meds" w points lw 2 linecolor rgb "brown",   \
     "coevolved-heterogenous-delta-0.1.meds" w points lw 2 linecolor rgb "green",  \
     "coevolved-heterogenous-delta-10.0.meds" w points lw 2 linecolor rgb "yellow"

set output "diversity-both.svg"
plot "independent-homogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "red" t "" ,   \
     "independent-homogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "blue" t "" , \
     "coevolved-homogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "red" t "" ,    \
     "coevolved-homogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "blue" t "" ,   \
     "coevolved-heterogenous-delta-0.1.ellipse" w lines lw 2 linecolor rgb "red" t "" ,  \
     "coevolved-heterogenous-delta-10.0.ellipse" w lines lw 2 linecolor rgb "blue" t "", \
     \
     "independent-homogenous-delta-0.1.meds"  w points lt 2 lw 2 linecolor rgb "red" t "",   \
     "independent-homogenous-delta-10.0.meds" w points lt 2 lw 2 linecolor rgb "blue" t "", \
     "coevolved-homogenous-delta-0.1.meds"    w points lt 2 lw 2 linecolor rgb "red" t "",    \
     "coevolved-homogenous-delta-10.0.meds"   w points lt 2 lw 2 linecolor rgb "blue" t "",   \
     "coevolved-heterogenous-delta-0.1.meds"  w points lt 2 lw 2 linecolor rgb "red" t "",  \
     "coevolved-heterogenous-delta-10.0.meds" w points lt 2 lw 2 linecolor rgb "blue" t ""

""");
fh.close()

os.system("gnuplot diversity_graph.p");
