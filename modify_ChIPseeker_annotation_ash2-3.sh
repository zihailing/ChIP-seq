#!/bin/sh
cat ChIPseeker_annotation_ash2-3.txt|tr '"' '\t' >aa
cut -f 2,4,5,6,8,9,10,12,13,14,16,18,19 aa >bb
perl ~/zihailing/YHH_HJG_20160302/annotate_function_ChIPseeker.pl bb ~/zihailing/species_20151012/Ath/with_no_isoform.annotation >cc
mv cc ChIPseeker_annotation_ash2-3_function.txt
rm aa bb 
