set terminal svg solid
set output "ATTLTE-Downlink.svg"
set title "AT\\&T LTE Downlink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 161, 3822 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 288, 940 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 254, 988 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 5426, 1208 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 325, 737 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 509, 1138 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 35, 435 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 197, 1025 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 52, 2304 textcolor lt 3 point pt 3 lc 3
set yrange [ 96.3 : 4160.7 ]
set xrange [ 5968.6 : 29.75 ]
plot "empty.txt"
set output
