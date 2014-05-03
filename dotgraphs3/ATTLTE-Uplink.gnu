set terminal svg solid
set output "ATTLTE-Uplink.svg"
set title "AT\\&T LTE Uplink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 350, 862 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 1236, 740 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 877, 844 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 24262, 841 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 1258, 428 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 1138, 439 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 520, 258 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 374, 693 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 127, 412 textcolor lt 3 point pt 3 lc 3
set yrange [ 197.6 : 922.4 ]
set xrange [ 26688.2 : 107.95 ]
plot "empty.txt"
set output
