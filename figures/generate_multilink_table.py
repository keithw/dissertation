#! /usr/bin/python
import numpy
import math
import sys

def logrange(below, above, num_points):
  start = math.log10(below)
  stop  = math.log10(above)
  return list(numpy.around(numpy.logspace(start, stop, num_points), 5));

#subsample = [1.0, 1.56152, 2.43835, 3.80755, 5.94557, 9.28415, 14.49741, 22.63803, 35.34981, 55.19954, 86.19536, 134.59603, 210.1748, 328.19279, 512.48059, 800.25023, 1000.0]
subsample = logrange(10.0, 100.0, 32)
#subsample = logrange(1, 1000.0, 32)

candidate1=open(sys.argv[1], "r");
candidate2=open(sys.argv[2], "r");
candidate1lines  = candidate1.readlines()
candidate2lines  = candidate2.readlines()
assert (len(candidate1lines) ==  len(candidate2lines))
file_length = len(candidate1lines)

candidate2_tpt = dict()
candidate2_del = dict()
candidate1_tpt = dict()
candidate1_del = dict()

for i in range(0, file_length):
  records = candidate1lines[i].split()
  link1 = float(records[0])
  link2 = float(records[1])
  if (link1 in subsample and link2 in subsample):
    candidate1_tpt[(link1, link2)] = (float(records[2]), float(records[4]), float(records[6]));
    candidate1_del[(link1, link2)] = (float(records[3]), float(records[5]), float(records[7]));

for i in range(0, file_length):
  records = candidate2lines[i].split()
  link1 = float(records[0])
  link2 = float(records[1])
  if (link1 in subsample and link2 in subsample):
    candidate2_tpt[(link1, link2)] = (float(records[2]), float(records[4]), float(records[6]));
    candidate2_del[(link1, link2)] = (float(records[3]), float(records[5]), float(records[7]));

# Generate table scaffolding
del_win = 0
del_loss = 0
del_tie = 0

tpt_win = 0
tpt_loss = 0
tpt_tie = 0

# Now generate the actual table
for link1 in subsample:
  for link2 in subsample:
    # Compare candidate 1  to candidate 2
    # color code table depending on who wins the contest
    tpt_gain = (candidate1_tpt[(link1, link2)][0] / candidate2_tpt[(link1,link2)][0], \
                candidate1_tpt[(link1, link2)][1] / candidate2_tpt[(link1,link2)][1], \
                candidate1_tpt[(link1, link2)][2] / candidate2_tpt[(link1,link2)][2])
    avg_tpt_gain = round( sum(tpt_gain) / 3.0, 1 );
    if (avg_tpt_gain > 1.0) :
      tpt_win += 1
    elif (avg_tpt_gain < 1.0) :
      tpt_loss += 1
    else :
      tpt_tie += 1

    del_gain = (candidate2_del[(link1, link2)][0] / candidate1_del[(link1,link2)][0], \
                candidate2_del[(link1, link2)][1] / candidate1_del[(link1,link2)][1], \
                candidate2_del[(link1, link2)][2] / candidate1_del[(link1,link2)][2])
    avg_del_gain = round( sum(del_gain) / 3.0, 1 );
    if (avg_del_gain > 1.0) :
      del_win += 1
    elif (avg_del_gain < 1.0) :
      del_loss += 1
    else :
      del_tie += 1
    print link1, link2, avg_tpt_gain, avg_del_gain
  print  

# Finish up table footer
print >>sys.stderr, "Del: won %d, lost %d, tie %d"%(del_win, del_loss, del_tie), "Tpt: won %d, lost %d, tie %d"%(tpt_win, tpt_loss, tpt_tie)
