set logscale x;
set logscale y;
set xlabel "link0 (Mbps)"
set ylabel "link1 (Mbps)"
set term svg
set output "cubic-multilink-tpt.svg"
splot "vscubic.data" using 1:2:3 notitle palette;

set output "cubic-multilink-del.svg"
splot "vscubic.data" using 1:2:4 notitle palette;

set output "cubicsfqCoDel-multilink-tpt.svg"
splot "vscubicsfqCoDel.data" using 1:2:3 notitle palette;

set output "cubicsfqCoDel-multilink-del.svg"
splot "vscubicsfqCoDel.data" using 1:2:4 notitle palette;
