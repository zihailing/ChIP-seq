# ChIP-seq
#Notice the chromosome column in the bed file produced by macs14, chromosome 1 maybe written as "1" or "Chr1", depending on the gff used in mapping. It may caused mistake in following steps.
#If it's "1" in the bed file, we can change it into "Chr" by following commond.
cat Ash2_macs_peaks.bed |awk '{print "Chr" $0}' >Ash2_macs_peaks_Chr.bed
#when run 'modify_ChIPseeker_annotation_xxx.sh', it will have the error report "Use of uninitialized value in concatenation (.) or string at /psc/home/zihailing/zihailing/YHH_HJG_20160302/annotate_function_ChIPseeker.pl line 23, <GEN0> line 1." it doesn't matter.
