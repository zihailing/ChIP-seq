rm (list=ls())
library(RColorBrewer)
setwd("/home/hlzi/project/TDX_ChIPComp_20170620")

all=read.table("common_peaks.xls",row.names=1)
all=all[,4:7]
group= c(rep("tmk4",2),rep("Col_0",2))
library(edgeR)
cds = DGEList(all,group =group)
cds = calcNormFactors(cds)
keep = rowSums(cpm(cds)>1)>=2
cds =cds[keep,]
log2counts = log2(cds$counts+1)

cds=estimateCommonDisp(cds,verbose=TRUE)
cds = estimateTagwiseDisp(cds)
cpmcounts = cpm(cds$counts+1)
tcounts = t(cpmcounts)
tt = colnames(all)
pca.all = prcomp(log2(tcounts[1:4,]), retx=TRUE)
pdf("tmk_ChIP_seq_pca.pdf")
c=round(100*summary(pca.all)$importance[2,1],digits=2)
d=round(100*summary(pca.all)$importance[2,2],digits=2)
plot(pca.all$x[,1:2], pch=c(rep(c(15,17),each=2)), xlab=paste("PC1(",c,"% Proportion of Variance)"),ylab=paste("PC2(",d,"%) Proportion of Variance"),col=c(rep(c("blue","red"),each=2)),main="PCA Plot of tmk4 ChIP-seq")
legend("bottom",cex=1,border=F, legend=tt,pch=c(rep(c(15,17),each=2)), col=c(rep(c("blue","red"),each=2)),bty="n",ncol=2)
dev.off()
