set terminal svg solid
set output "T-Mobile3GUMTS-Uplink.svg"
set title "T-Mobile 3G (UMTS) Uplink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 252, 833 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 826, 607 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 1775, 850 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 32640, 971 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 761, 320 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 1917, 454 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 1135, 265 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 551, 693 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 136, 370 textcolor lt 3 point pt 3 lc 3
set yrange [ 194.4 : 1041.6 ]
set xrange [ 35904 : 115.6 ]
plot "empty.txt"
set output
