#! /bin/bash

python generate_multilink_table.py  plots-10x-new-multilink/multilink10x.plot plots-10x-new-multilink/multilinkcubic.plot > vscubic.data

python generate_multilink_table.py  plots-10x-new-multilink/multilink10x.plot plots-10x-new-multilink/multilinkcubicsfqCoDel.plot > vscubicsfqCoDel.data

gnuplot multilink.p
