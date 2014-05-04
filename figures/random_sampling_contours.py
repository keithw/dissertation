#! /usr/bin/python
import sys
fh = sys.stdin
from scipy.spatial import ConvexHull
import matplotlib.pyplot as plt
import numpy
from math import log
from matplotlib.ticker import ScalarFormatter 

x_vector = []
y_vector = []
tmp_points = []

# Read in x-y points
for line in fh.readlines():
  x = float(line.split()[0])
  y = float(line.split()[1])
  x_vector += [x]
  y_vector += [y]
  tmp_points += [(x, y)]

# Sort the vectors
x_vector.sort()
y_vector.sort()

# Find median
x_median = x_vector[int(0.5 * len(x_vector))]
y_median = y_vector[int(0.5 * len(y_vector))]
print "Median: ", x_median, y_median

# Now, sort according to distance from median
tmp_points.sort(key = lambda t : (log(t[0]) - log(x_median)) ** 2 + (log(t[1]) - log(y_median)) ** 2)
tmp_points.sort(key = lambda t : (log(t[0]) - log(x_median)) ** 2 + (log(t[1]) - log(y_median)) ** 2)

# Put it into a numpy array
points = numpy.array(tmp_points)
plt.plot(points[:,0], points[:,1], '.')

# 50 % contour
hull = ConvexHull( points[0 : int(round(len(tmp_points) * 0.5))] )
median_plt = []
for simplex in hull.simplices:
    median_plt, = plt.plot(points[simplex,0], points[simplex,1], 'm-', linewidth = 4.0, label = '50th percentile')

# 68 % contour
large_plt = []
hull = ConvexHull( points[0 : int(round(len(tmp_points) * 0.68))] )
for simplex in hull.simplices:
    large_plt, = plt.plot(points[simplex,0], points[simplex,1], 'k-', linewidth = 4.0, label = '68th percentile')

# 95 % contour
huge_plt = []
hull = ConvexHull( points[0 : int(round(len(tmp_points) * 0.95))] )
for simplex in hull.simplices:
    huge_plt, = plt.plot(points[simplex,0], points[simplex,1], 'g-', linewidth = 4.0, label = '95th percentile')

plt.axis([0.02, 50, 0.02, 50])
plt.xscale('log')
plt.yscale('log')
plt.axhline(y=1, linewidth = 2.0, color = 'r')
plt.axvline(x=1, linewidth = 2.0, color = 'r')
a = plt.gca()
a.set_xticks([0.025, 0.1, 1, 10, 40])
a.set_yticks([0.025, 0.1, 1, 10, 40])

formatter = ScalarFormatter()
formatter.set_scientific(False) 

a.xaxis.set_major_formatter(formatter)
a.yaxis.set_major_formatter(formatter)

plt.xlabel("Throughput improvement")
plt.ylabel("Delay improvement")

plt.legend([median_plt, large_plt, huge_plt], ["50th percentile", "68th percentile", "95th percentile"])

plt.show()
