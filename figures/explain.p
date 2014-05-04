set term svg

set output "tx-queue-aware.svg"
set xlabel "Time (seconds)"
plot "qsynthcompatible.txt" u 1:5 w lines t "Queue Size in packets", "ratsynthcompatible.tx" u 2:(100) t "[TCP-Aware] TaoCC transmissions", "tcpsynthcompatible.tx" u 2:(200)  t "TCP transmissions", "tcpsynthcompatible.drops" u 2:(150) t "TCP drops"

set output "tx-queue-naive.svg"
set xlabel "Time (seconds)"
plot "qsynthnaive.txt" u 1:5 w lines t "Queue Size in packets", "ratsynthnaive.tx" u 2:(100) t "[TCP-Naive] TaoCC transmissions", "tcpsynthnaive.tx" u 2:(200)  t "TCP transmissions", "tcpsynthnaive.drops" u 2:(150) t "TCP drops"
