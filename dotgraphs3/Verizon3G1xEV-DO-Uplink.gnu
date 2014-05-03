set terminal svg solid
set output "Verizon3G1xEV-DO-Uplink.svg"
set title "Verizon 3G (1xEV-DO) Uplink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 355, 628 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 775, 261 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 1253, 475 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 12379, 166 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 4407, 374 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 3665, 312 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 1961, 229 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 994, 311 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 199, 239 textcolor lt 3 point pt 3 lc 3
set yrange [ 119.8 : 674.2 ]
set xrange [ 13616.9 : 169.15 ]
plot "empty.txt"
set output
