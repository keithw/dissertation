set terminal svg solid
set output "VerizonLTE-Downlink.svg"
set title "Verizon LTE Downlink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 208, 7413 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 349, 2059 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 313, 3040 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 7568, 5719 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 1160, 947 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 1621, 1119 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 364, 462 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 215, 2773 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 73, 4741 textcolor lt 3 point pt 3 lc 3
set yrange [ 0 : 8108.1 ]
set xrange [ 8324.8 : 62.05 ]
plot "empty.txt"
set output
