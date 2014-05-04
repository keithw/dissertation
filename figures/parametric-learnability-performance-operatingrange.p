set term svg
set macros
formatting = "lw 4 w linespoints"
set key bottom right

set style data lines

set output "link-agility-tpt.svg"
set title  "Link Speed Agility"
set xlabel "Link speed"
set ylabel "Utilization"
set logscale x
ordinate ="($2/$1)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeedcubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/linkspeedcubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "link-agility-delay.svg"
set title  "Link Speed Agility"
set xlabel "Link speed"
set ylabel "Normalized RTT"
set yrange [*:*] reverse
set logscale x
ordinate ="($3/150)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeedcubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/linkspeedcubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set yrange [*:*] noreverse
set output "link-agility-util.svg"
set title  "Link Speed Agility"
set xlabel "Link speed"
set ylabel "Normalized objective function"
set logscale x
ordinate ="log ($2/$1) - log ($3/150)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeedcubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/linkspeedcubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"


unset logscale x
set output "rtt-agility-tpt.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Utilization"
ordinate = "($2/31.622)"
plot "parametric-oprange/delay1000x.plot" u (2 * $1):(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/delaycubic.plot" u (2 * $1):(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/delaycubicsfqCoDel.plot" u (2 * $1):(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "rtt-agility-delay.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Normalized RTT"
set yrange [*:*] reverse
ordinate = "($3/(2 * $1))"
plot "parametric-oprange/delay1000x.plot" u (2 * $1):(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/delaycubic.plot" u (2 * $1):(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/delaycubicsfqCoDel.plot" u (2 * $1):(@ordinate) @formatting t "Cubic-sfqCoDel"

set yrange [*:*] noreverse
set output "rtt-agility-util.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Normalized objective function"
ordinate = "log ($2/31.622) - log($3/(2 * $1))"
plot "parametric-oprange/delay1000x.plot" u (2 * $1):(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/delaycubic.plot" u (2 * $1):(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/delaycubicsfqCoDel.plot" u (2 * $1):(@ordinate) @formatting t "Cubic-sfqCoDel"

unset logscale x
set output "workload-agility-tpt.svg"
set title  ""
set xlabel "On percentage"
set ylabel "Utilization"
ordinate = "($2/31.622)"
plot "parametric-oprange/dutycycle1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/dutycyclecubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/dutycyclecubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "workload-agility-delay.svg"
set title  ""
set xlabel "On percentage"
set ylabel "Normalized RTT"
set yrange [*:*] reverse
ordinate = "($3/150)"
plot "parametric-oprange/dutycycle1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/dutycyclecubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/dutycyclecubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set yrange [*:*] noreverse
set output "workload-agility-util.svg"
set title  ""
set xlabel "On percentage"
set ylabel "Normalized Objective Function"
ordinate = "log ($2/31.622) - log ($3/150)"
plot "parametric-oprange/dutycycle1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/dutycyclecubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/dutycyclecubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"


unset logscale x
set output "muxing-agility-tpt.svg"
set title  ""
set xlabel "Number of senders"
set ylabel "Utilization"
unset logscale x
ordinate ="($2/(31.622/$1))"
plot "parametric-oprange/num_senders1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "muxing-agility-delay.svg"
set title  ""
set xlabel "Number of senders"
set ylabel "Normalized RTT"
set yrange [*:*] reverse
unset logscale x
ordinate ="($3/150)"
plot "parametric-oprange/num_senders1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set yrange [*:*] noreverse
set output "muxing-agility-util.svg"
set title  ""
set xlabel "Number of senders"
set ylabel "Normalized Objective Function"
unset logscale x
ordinate ="log ($2/(31.622/$1)) - log($3/150)"
plot "parametric-oprange/num_senders1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "tradeoff-tpt.svg"
set title  ""
set xlabel "Link speed"
set ylabel "Utilization"
set logscale x
ordinate ="($2/$1)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeed100x.plot" u 1:(@ordinate) @formatting t "Tao-100x", \
     "parametric-oprange/linkspeed10x.plot" u 1:(@ordinate) @formatting t "10x-Remy", \
     "parametric-oprange/linkspeed2x.plot" u 1:(@ordinate) @formatting t "2x-Remy"

set output "tradeoff-delay.svg"
set title  ""
set xlabel "Link speed"
set ylabel "Normalized RTT"
set yrange [*:*] reverse
set logscale x
ordinate ="($3/150)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeed100x.plot" u 1:(@ordinate) @formatting t "Tao-100x", \
     "parametric-oprange/linkspeed10x.plot" u 1:(@ordinate) @formatting t "Tao-10x", \
     "parametric-oprange/linkspeed2x.plot" u 1:(@ordinate) @formatting t "Tao-2x"

set yrange [*:*] noreverse
set output "tradeoff-util.svg"
set title  ""
set xlabel "Link speed"
set ylabel "Normalized Objective Function"
set logscale x
ordinate ="log ($2/$1) - log ($3/150)"
plot "parametric-oprange/linkspeed1000x.plot" u 1:(@ordinate) @formatting t "Tao-1000x", \
     "parametric-oprange/linkspeed100x.plot" u 1:(@ordinate) @formatting t "Tao-100x", \
     "parametric-oprange/linkspeed10x.plot" u 1:(@ordinate) @formatting t "Tao-10x", \
     "parametric-oprange/linkspeed2x.plot" u 1:(@ordinate) @formatting t "Tao-2x"

## Robustness
unset logscale x
set yrange [*:*] noreverse
set output "rtt-robust-util.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Normalized objective function"
ordinate = "log ($2/31.622) - log($3/(2 * $1))"
plot "parametric-oprange/rtt10x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 110-200", \
     "parametric-oprange/rtt20x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 50-250", \
     "parametric-oprange/rtt30x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 10-280", \
     "parametric-oprange/rttandlinkspeed.plot" u (2 * $1):(@ordinate) @formatting t "rtt:50-250 2x linkspeed", \
     "parametric-oprange/delay2x.plot" u (2 * $1):(@ordinate) @formatting t "2x link speed", \

set output "rtt-robust-tpt.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Utilization"
ordinate = "($2/31.622)"
plot "parametric-oprange/rtt10x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 110-200", \
     "parametric-oprange/rtt20x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 50-250", \
     "parametric-oprange/rtt30x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 10-280", \
     "parametric-oprange/rttandlinkspeed.plot" u (2 * $1):(@ordinate) @formatting t "rtt:50-250 2x linkspeed", \
     "parametric-oprange/delay2x.plot" u (2 * $1):(@ordinate) @formatting t "2x link speed"

set output "rtt-robust-delay.svg"
set title  ""
set xlabel "RTT in ms"
set ylabel "Normalized RTT"
ordinate = "($3/(2 * $1))"
plot "parametric-oprange/rtt10x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 110-200", \
     "parametric-oprange/rtt20x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 50-250", \
     "parametric-oprange/rtt30x.plot" u (2 * $1):(@ordinate) @formatting t "rtt: 10-280", \
     "parametric-oprange/rttandlinkspeed.plot" u (2 * $1):(@ordinate) @formatting t "rtt:50-250 2x linkspeed", \
     "parametric-oprange/delay2x.plot" u (2 * $1):(@ordinate) @formatting t "2x link speed"

## Muxing Robustness
unset logscale x
set yrange [*:*] noreverse
set output "muxing-robust-util.svg"
set title  ""
set xlabel "Senders"
set ylabel "Normalized objective function"
ordinate = "log ($2/(31.622/$1)) - log($3/150)"
plot "parametric-oprange/num_senders-100x10senders.plot" u 1:(@ordinate) @formatting t "100x link range, 1-10 senders", \
     "parametric-oprange/num_senders-100x2senders.plot" u 1:(@ordinate) @formatting t "100x link range 2 senders", \
     "parametric-oprange/num_senders-muxing10.plot" u 1:(@ordinate) @formatting t "1-10 senders 32 Mbps", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "muxing-robust-tpt.svg"
set title  ""
set xlabel "Senders"
set ylabel "Utilization"
ordinate = "($2/(31.622/$1))"
plot "parametric-oprange/num_senders-100x10senders.plot" u 1:(@ordinate) @formatting t "100x link range, 1-10 senders", \
     "parametric-oprange/num_senders-100x2senders.plot" u 1:(@ordinate) @formatting t "100x link range 2 senders", \
     "parametric-oprange/num_senders-muxing10.plot" u 1:(@ordinate) @formatting t "1-10 senders 32 Mbps", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"

set output "muxing-robust-delay.svg"
set title  ""
set xlabel "Senders"
set ylabel "Normalized RTT"
ordinate = "($3/(2 * $1))"
plot "parametric-oprange/num_senders-100x10senders.plot" u 1:(@ordinate) @formatting t "100x link range, 1-10 senders", \
     "parametric-oprange/num_senders-100x2senders.plot" u 1:(@ordinate) @formatting t "100x link range 2 senders", \
     "parametric-oprange/num_senders-muxing10.plot" u 1:(@ordinate) @formatting t "1-10 senders 33 Mbps", \
     "parametric-oprange/num_senderscubic.plot" u 1:(@ordinate) @formatting t "Cubic", \
     "parametric-oprange/num_senderscubicsfqCoDel.plot" u 1:(@ordinate) @formatting t "Cubic-sfqCoDel"
