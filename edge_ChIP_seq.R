rm (list=ls())

setwd("/home/hlzi/project/TDX_ChIPComp_20170620")

raw=read.table("common_peaks.xls",row.names=1)
all=raw[,4:7]
group= c(rep("tmk4",2),rep("Col_0",2))
library(edgeR)
cds = DGEList(all,group =group)
cds = calcNormFactors(cds)
keep = rowSums(cpm(cds)>1)>=0
cds =cds[keep,]
log2counts = log2(cds$counts+1)
cds=estimateCommonDisp(cds,verbose=TRUE)
cds = estimateTagwiseDisp(cds)
cpmcounts = cpm(cds$counts+1)
tcounts = t(cpmcounts)
pca.total = prcomp(log2(tcounts), retx=TRUE)
#########################################################

DEG = function(sample1, sample2){
	de.out=exactTest(cds,pair=c(sample1,sample2))
	rawcount = as.matrix(all)[(rownames(topTags(de.out,n=100000))),]
	rawcount=rawcount[order(rownames(rawcount)),]
	table=topTags(de.out,n=100000)$table
	table=table[order(rownames(table)),]
	sam_cpm=cpm(cds$count)[row.names(rawcount),]
	all=cbind(rawcount,sam_cpm,table)

	all=all[order(all$PValue),]
	
	all=cbind(raw[,c(1:3,8)],all)
	write.table(all,paste0(sample2,sample1,"edgeR.out"),sep="\t",row.names=T,col.names=T,quote=F)

	de.up=subset(all,((all$FDR<0.05)&(all$logFC) >= 1))
	de.down=subset(all,((all$FDR<0.05)&(all$logFC) <= -1))
	write.table(de.up,paste0(sample2,sample1,".up"),sep="\t",row.names=T,col.names=T,quote=F)
	write.table(de.down,paste0(sample2,sample1,".down"),sep="\t",row.names=T,col.names=T,quote=F)


	c1up=nrow(subset(all,((all$FDR<0.05) & (all$logFC) >=1)))
	c1down=nrow(subset(all,((all$FDR<0.05) & (all$logFC) <= -1)))
	c0.58up=nrow(subset(all,((all$FDR<0.05) & (all$logFC) >=0.58)))
	c0.58down=nrow(subset(all,((all$FDR<0.05) & (all$logFC) <= -0.58)))
	de.log=matrix(c(c1up,c1down,c0.58up,c0.58down),nrow=2)
	write.table(de.log,paste0(sample2,sample1,"Cutoff.log"),sep="\t",row.names=F,col.names=T,quote=F)
	}
DEG("Col_0","tmk4")
