set terminal svg solid
set output "Verizon3G1xEV-DO-Downlink.svg"
set title "Verizon 3G (1xEV-DO) Downlink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 1608, 402 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 5498, 385 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 1387, 372 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 97631, 521 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 4034, 157 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 7054, 191 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 9274, 163 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 1771, 300 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 1287, 209 textcolor lt 3 point pt 3 lc 3
set yrange [ 120.6 : 557.4 ]
set xrange [ 107394.1 : 1093.95 ]
plot "empty.txt"
set output
