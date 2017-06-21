library(ChIPComp)
conf=data.frame(
	SampleID=1:4,
	condition=c("tmk4","tmk4","Col-0","Col-0"),
	factor=c("H3K36me3","H3K36me3","H3K36me3","H3K36me3"),
	ipReads=system.file("extdata",c("tmk4-1_treatment_unique_sorted_rmdup.bam","tmk4-2_treatment_unique_sorted_rmdup.bam","Col-0-1_treatment_unique_sorted_rmdup.bam","Col-0-2_treatment_unique_sorted_rmdup.bam"),package="ChIPComp"),
	ctReads=system.file("extdata",c("tmk4-1_input_unique.bam","tmk4-2_input_unique.bam","Col-0-1_input_unique.bam","Col-0-2_input_unique.bam"),package="ChIPComp"),
	peaks=system.file("extdata",c("tmk4-1_peaks.bed","tmk4-2_peaks.bed","Col-0-1_peaks.bed","Col-0-2_peaks.bed"),package="ChIPComp")
)

design=as.data.frame(lapply(conf[,c("condition","factor")],as.numeric))-1
design=as.data.frame(model.matrix(~condition,design))
countset=makeCountSet(conf,design,filetype="bam")
