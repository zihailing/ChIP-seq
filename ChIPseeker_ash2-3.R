setwd("/psc/home/zihailing/zihailing/YHH_HXG_20160415")
library(ChIPpeakAnno)
library(GenomicRanges)
library(GenomicFeatures)
library(rtracklayer)

gff<-system.file("try_data_20151205", "TAIR10_GFF3_genes.gff", package="ChIPpeakAnno")
TxDb.gr3<-makeTxDbFromGFF(gff, format="gff3")

require(ChIPseeker)
peak<-readPeakFile("/psc/home/zihailing/zihailing/YHH_HXG_20160415/macs_result/ash2-3_macs_peaks_Chr.bed")
peakAnno <- annotatePeak(peak, tssRegion=c(-3000, 3000), TxDb=TxDb.gr3)
pdf("ChIPseeker_ash2-3.pdf")
plotAnnoPie(peakAnno)
dev.off()

write.table(as.data.frame(peakAnno), file="ChIPseeker_annotation_ash2-3.txt")
