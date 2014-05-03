set terminal svg solid
set output "T-Mobile3GUMTS-Downlink.svg"
set title "T-Mobile 3G (UMTS) Downlink"
set logscale x
unset label
set xlabel "Self-inflicted delay (ms)"
set ylabel "Throughput (kbps)"
set xtics (10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000, 3000, 5000, 10000, 20000, 30000, 50000, 100000)
set ytics format "% 4.0f"
set size ratio 1.0/1.85
set label "\\color{Orange}\\color{blue}Sprout-EWMA" at 487, 1600 textcolor lt 3 point pt 3 lc 3
set label "\\color{ForestGreen}Compound TCP" at 1472, 761 textcolor lt 2 point pt 2 lc 2
set label "\\color{ForestGreen}LEDBAT" at 569, 781 textcolor lt 2 point pt 2 lc 2
set label "\\color{Orange}Cubic" at 8350, 668 textcolor lt 7 point pt 7 lc 7
set label "\\color{red}Skype" at 1584, 475 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Facetime" at 2643, 462 textcolor lt 1 point pt 1 lc 1
set label "\\color{red}Google Hangout" at 2077, 236 textcolor lt 1 point pt 1 lc 1
set label "\\color{ForestGreen}Vegas" at 499, 762 textcolor lt 2 point pt 2 lc 2
set label "\\color{blue}Sprout" at 331, 680 textcolor lt 3 point pt 3 lc 3
set yrange [ 99.6 : 1736.4 ]
set xrange [ 9185 : 281.35 ]
plot "empty.txt"
set output
