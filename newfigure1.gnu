ending = 880
#outputname = "frames/frame00026.png"

#ending = 860.25
#outputname = "test.png"

set terminal svg
set output "newfigure1.svg"

#set terminal pngcairo enhanced rounded size 1024,768
#set output outputname

set multiplot layout 2,1

set style data lines
#set xrange [860:940]
#set xrange [870+.5:890+.5]
set xrange [880:940]

unset key

set xtics 5
unset grid

set key box
set key left bottom

set xtics ("0:00" 840, "0:05" 845, "0:10" 850, "0:15" 855, "0:20" 860, "0:25" 865, "0:30" 870, "0:35" 875, "0:40" 880, "0:45" 885, "0:50" 890, "0:55" 895, "1:00" 900, "1:05" 905, "1:10" 910, "1:15" 915, "1:20" 920, "1:25" 925, "1:30" 930, "1:35" 935, "1:40" 940, "1:45" 945, "1:50" 950, "1:55" 955, "2:00" 960, "2:05" 965, "2:10" 970, "2:15" 975, "2:20" 980);

set logscale y
set yrange [35:1500]
set ytics auto
set ylabel "throughput (kbps)"
plot "sprout.usage" using 2:($5/1.e3) with lines lt 7 lw 3 title "Capacity", "skype.usage" using 2:($9/1.e3) with lines lt 1 lw 3 title "Skype", "sprout.usage" using 2:($9/1.e3) with lines lt 3 lw 3 title "Sprout"

unset key

set logscale y
set yrange [20:5000]
set ylabel "delay (ms)"
set ytics (50, 100, 500, 1000, 5000)
plot "both.kd" using 1:2 with lines lt 1 lw 5, "" using 1:3 with lines lw 2 lc 3, 100

unset multiplot

set output