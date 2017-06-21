#!/bin/sh
grep -v '#' output_results --|awk 'NR==1||$12<-1{print $0}' >DEPs_down
grep -v '#' output_results --|awk 'NR==1||$12>1{print $0}' >DEPs_up
perl add_deps_name.pl DEPs_down >DEPs_down.xls
perl add_deps_name.pl DEPs_up >DEPs_up.xls
