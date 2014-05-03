set terminal svg solid
set output "codelcomp.svg"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Utilization (percent)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{blue}Sprout" at 317, 42.1 textcolor lt 3 point pt 3 lc 3
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 525, 79.7 textcolor lt 3 point pt 3 lc 3
set label "\\color{Orange}Cubic" at 25164, 61.7 textcolor lt 7 point pt 7 lc 7
set label "\\color{Orange}Cubic-CoDel" at 497.4, 61.1 textcolor lt 7 point pt 7 lc 7
set yrange [ 0 : 100 ]
set xrange [ 40000 : 200 ]
plot "empty.txt"
set output
