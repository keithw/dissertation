set term svg
set arrow from 1,0.02 to 1,50
set xlabel "Throughput improvement"
set ylabel "Delay improvement"

set logscale x
set logscale y
set xrange [0.02:50]
set yrange [0.02:50]

set title "1 to 10 senders, 50 to 300 ms, 1 to 1000 mbps, 0 to 100%"
set output "random-sweep/cubicredone.svg"
plot "cubic.redone" w points, 1

set output "random-sweep/cubicsfqCoDelredone.svg"
plot "cubicsfqCoDel.redone" w points, 1

set title "1 to 10 senders, 50 to 300 ms, 1 to 1000 mbps, 0 to 100%"
set output "random-sweep/cubic10.svg"
plot "cubic.10senders.improve" w points, 1

set output "random-sweep/cubicsfqCoDel10.svg"
plot "cubicsfqCoDel.10senders.improve" w points, 1

set title "1 to 2 senders, 50 to 300 ms, 1 to 1000 mbps, 0 to 100%"
set output "random-sweep/cubic2.svg"
plot "cubic.2senders.improve" w points, 1

set output "random-sweep/cubicsfqCoDel2.svg"
plot "cubicsfqCoDel.2senders.improve" w points, 1
