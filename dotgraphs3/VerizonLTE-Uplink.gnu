set terminal svg solid
set output "VerizonLTE-Uplink.svg"
set title "Verizon LTE Uplink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 780, 4981 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 1777, 2005 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 675, 3014 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 13059, 4362 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 6624, 973 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 3469, 988 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 2862, 313 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 725, 2638 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 332, 3703 textcolor lt 3 point pt 3 lc 3
set yrange [ 0 : 5447.8 ]
set xrange [ 14364.9 : 282.2 ]
plot "empty.txt"
set output
