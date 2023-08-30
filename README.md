#####################################################################################
library(dplyr)
library(Seurat)
library(patchwork)
library(gridExtra)
library(ggplot2)

#####################################################################################
#install.packages(c("SeuratObject", "Seurat"))
library(SeuratObject)
library(Seurat)
#####################################################################################
# Save whole workspace to working directory
#load("./all_data.RData")

# Set intput dir
cDNA_M1_dir="/home/felipe/snRNASeq_output/cDNA-M1/outs/filtered_feature_bc_matrix/"
cDNA_M2_dir="/home/felipe/snRNASeq_output/cDNA-M2/outs/filtered_feature_bc_matrix/"
cDNA_M3_dir="/home/felipe/snRNASeq_output/cDNA-M3/outs/filtered_feature_bc_matrix/"
cDNA_M4_dir="/home/felipe/snRNASeq_output/cDNA-M4/outs/filtered_feature_bc_matrix/"
cDNA_M5_dir="/home/felipe/snRNASeq_output/cDNA-M5/outs/filtered_feature_bc_matrix/"
cDNA_M6_dir="/home/felipe/snRNASeq_output/cDNA-M6/outs/filtered_feature_bc_matrix/"
cDNA_agg_dir="/home/felipe/snRNASeq_output/aggregate/outs/count/filtered_feature_bc_matrix/"

# Set output dir
output_dir="/home/felipe/snRNASeq_output/results/"
#####################################################################################
# First, load the tables 
# Load table for all sample - aggreagate cellranger for the six samples
cDNAM1.Read10X<-Read10X(data.dir=cDNA_M1_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
cDNAM2.Read10X<-Read10X(data.dir=cDNA_M2_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
cDNAM3.Read10X<-Read10X(data.dir=cDNA_M3_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
cDNAM4.Read10X<-Read10X(data.dir=cDNA_M4_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
cDNAM5.Read10X<-Read10X(data.dir=cDNA_M5_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
cDNAM6.Read10X<-Read10X(data.dir=cDNA_M6_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)
aggregate.Read10X<-Read10X(data.dir=cDNA_agg_dir, gene.column = 2, cell.column = 1, unique.features = TRUE, strip.suffix = FALSE)

# Load table for all sample - aggreagate cellranger for the six samples
cDNAM1.pbmc <- CreateSeuratObject(counts = cDNAM1.Read10X, project = "hypotha")
cDNAM2.pbmc <- CreateSeuratObject(counts = cDNAM2.Read10X, project = "hypotha")
cDNAM3.pbmc <- CreateSeuratObject(counts = cDNAM3.Read10X, project = "hypotha")
cDNAM4.pbmc <- CreateSeuratObject(counts = cDNAM4.Read10X, project = "hypotha")
cDNAM5.pbmc <- CreateSeuratObject(counts = cDNAM5.Read10X, project = "hypotha")
cDNAM6.pbmc <- CreateSeuratObject(counts = cDNAM6.Read10X, project = "hypotha")
aggregate.pbmc <- CreateSeuratObject(counts = aggregate.Read10X, project = "hypotha")

# Scale the data
cDNAM1.pbmc <- ScaleData(cDNAM1.pbmc)
cDNAM2.pbmc <- ScaleData(cDNAM2.pbmc)
cDNAM3.pbmc <- ScaleData(cDNAM3.pbmc)
cDNAM4.pbmc <- ScaleData(cDNAM4.pbmc)
cDNAM5.pbmc <- ScaleData(cDNAM5.pbmc)
cDNAM6.pbmc <- ScaleData(cDNAM6.pbmc)
aggregate.pbmc <- ScaleData(aggregate.pbmc)

save(cDNAM1.pbmc, file = "DimPlot1.RData")
save(cDNAM2.pbmc, file = "DimPlot2.RData")
save(cDNAM3.pbmc, file = "DimPlot3.RData")
save(cDNAM4.pbmc, file = "DimPlot4.RData")
save(cDNAM5.pbmc, file = "DimPlot5.RData")
save(cDNAM6.pbmc, file = "DimPlot6.RData")
save(aggregate.pbmc, file = "aggregate.RData")


load(file = "DimPlot1.RData")
load(file = "DimPlot2.RData")
load(file = "DimPlot3.RData")
load(file = "DimPlot4.RData")
load(file = "DimPlot5.RData")
load(file = "DimPlot6.RData")
load(file = "aggregate.RData")


# Save whole workspace to working directory
#save.image("./all_data.RData")
#####################################################################################
# Second create quality plots
# The [[ operator can add columns to object metadata. This is a great place to stash QC stats
cDNAM1.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM1.pbmc, pattern = "^MT-")
cDNAM2.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM2.pbmc, pattern = "^MT-")
cDNAM3.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM3.pbmc, pattern = "^MT-")
cDNAM4.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM4.pbmc, pattern = "^MT-")
cDNAM5.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM5.pbmc, pattern = "^MT-")
cDNAM6.pbmc[["percent.mt"]] <- PercentageFeatureSet(cDNAM6.pbmc, pattern = "^MT-")
aggregate.pbmc[["percent.mt"]] <- PercentageFeatureSet(aggregate.pbmc, pattern = "^MT-")

#####################################################################################
# Visualize QC metrics as a violin plot
# Visualize QC metrics as a violin plot
VlnPlotA.cDNAM1<-VlnPlot(cDNAM1.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM2<-VlnPlot(cDNAM2.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM3<-VlnPlot(cDNAM3.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM4<-VlnPlot(cDNAM4.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM5<-VlnPlot(cDNAM5.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM6<-VlnPlot(cDNAM6.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="gray0", pt.size = 0, ncol = 3)

# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM1.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM1)
dev.off()
# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM2.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM2)
dev.off()
# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM3.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM3)
dev.off()
# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM4.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM4)
dev.off()
# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM5.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM5)
dev.off()
# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlot_cDNAM6.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot(VlnPlotA.cDNAM6)
dev.off()

VlnPlotB.cDNAM1<-VlnPlot(cDNAM1.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)
VlnPlotB.cDNAM2<-VlnPlot(cDNAM2.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)
VlnPlotB.cDNAM3<-VlnPlot(cDNAM3.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)
VlnPlotB.cDNAM4<-VlnPlot(cDNAM4.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)
VlnPlotB.cDNAM5<-VlnPlot(cDNAM5.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)
VlnPlotB.cDNAM6<-VlnPlot(cDNAM6.pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), cols="white", pt.size = 0.0001, ncol = 3)

# Save VlnPlot
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM1.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM1)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM2.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM2)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM3.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM3)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM4.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM4)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM5.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM5)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM5.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM5)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM5.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM5)
dev.off()
png(filename=paste(output_dir,"hypotha_VlnPlotB_cDNAM6.png",sep=""), width = 24, height = 10, res=800, units = "cm")
plot( VlnPlotB.cDNAM6)
dev.off()

#####################################################################################
# Visualize QC metrics as a violin plot (combine)
VlnPlotA.cDNAM1<-VlnPlot(cDNAM1.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM2<-VlnPlot(cDNAM2.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM3<-VlnPlot(cDNAM3.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM4<-VlnPlot(cDNAM4.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM5<-VlnPlot(cDNAM5.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM6<-VlnPlot(cDNAM6.pbmc, features = c("nFeature_RNA"), cols="gray0", pt.size = 0, ncol = 3)

# VlnPlotA.cDNAM1.data
VlnPlotA.cDNAM1.data<-data.frame(Sample="cDNAM1", Primer=rownames(VlnPlotA.cDNAM1$data), VlnPlotA.cDNAM1$data)
VlnPlotA.cDNAM2.data<-data.frame(Sample="cDNAM2", Primer=rownames(VlnPlotA.cDNAM2$data), VlnPlotA.cDNAM2$data)
VlnPlotA.cDNAM3.data<-data.frame(Sample="cDNAM3", Primer=rownames(VlnPlotA.cDNAM3$data), VlnPlotA.cDNAM3$data)
VlnPlotA.cDNAM4.data<-data.frame(Sample="cDNAM4", Primer=rownames(VlnPlotA.cDNAM4$data), VlnPlotA.cDNAM4$data)
VlnPlotA.cDNAM5.data<-data.frame(Sample="cDNAM5", Primer=rownames(VlnPlotA.cDNAM5$data), VlnPlotA.cDNAM5$data)
VlnPlotA.cDNAM6.data<-data.frame(Sample="cDNAM6", Primer=rownames(VlnPlotA.cDNAM6$data), VlnPlotA.cDNAM6$data)


df_cDNAM1<-data.frame(Sample="cDNAM1", VlnPlotA.cDNAM1$data,Primer=rownames(VlnPlotA.cDNAM1.data))
df_cDNAM2<-data.frame(Sample="cDNAM2", VlnPlotA.cDNAM2$data,Primer=rownames(VlnPlotA.cDNAM2.data))
df_cDNAM3<-data.frame(Sample="cDNAM3", VlnPlotA.cDNAM3$data,Primer=rownames(VlnPlotA.cDNAM3.data))
df_cDNAM4<-data.frame(Sample="cDNAM4", VlnPlotA.cDNAM4$data,Primer=rownames(VlnPlotA.cDNAM4.data))
df_cDNAM5<-data.frame(Sample="cDNAM5", VlnPlotA.cDNAM5$data,Primer=rownames(VlnPlotA.cDNAM5.data))
df_cDNAM6<-data.frame(Sample="cDNAM6", VlnPlotA.cDNAM6$data,Primer=rownames(VlnPlotA.cDNAM6.data))

# Createpair merges
merge1=rbind(df_cDNAM1,df_cDNAM2,df_cDNAM3,df_cDNAM4,df_cDNAM5,df_cDNAM6)

# Combine nmerges
VlnPlotA<-ggplot(merge1, aes(x=Sample, y=nFeature_RNA,fill="black")) +  geom_violin() + theme_bw() + scale_fill_manual(values=c("black"))+ guides(fill="none")  + theme(axis.text.x=element_text(angle=90, hjust=1)) + theme(axis.title.x = element_blank())+ ggtitle("QC metrics as a violin plot")

#####################################################################################
# Visualize QC metrics as a violin plot (combine)
VlnPlotA.cDNAM1<-VlnPlot(cDNAM1.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM2<-VlnPlot(cDNAM2.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM3<-VlnPlot(cDNAM3.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM4<-VlnPlot(cDNAM4.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM5<-VlnPlot(cDNAM5.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)
VlnPlotA.cDNAM6<-VlnPlot(cDNAM6.pbmc, features = c("nCount_RNA"), cols="gray0", pt.size = 0, ncol = 3)

# VlnPlotA.cDNAM1.data
VlnPlotA.cDNAM1.data<-data.frame(Sample="cDNAM1", Primer=rownames(VlnPlotA.cDNAM1$data), VlnPlotA.cDNAM1$data)
VlnPlotA.cDNAM2.data<-data.frame(Sample="cDNAM2", Primer=rownames(VlnPlotA.cDNAM2$data), VlnPlotA.cDNAM2$data)
VlnPlotA.cDNAM3.data<-data.frame(Sample="cDNAM3", Primer=rownames(VlnPlotA.cDNAM3$data), VlnPlotA.cDNAM3$data)
VlnPlotA.cDNAM4.data<-data.frame(Sample="cDNAM4", Primer=rownames(VlnPlotA.cDNAM4$data), VlnPlotA.cDNAM4$data)
VlnPlotA.cDNAM5.data<-data.frame(Sample="cDNAM5", Primer=rownames(VlnPlotA.cDNAM5$data), VlnPlotA.cDNAM5$data)
VlnPlotA.cDNAM6.data<-data.frame(Sample="cDNAM6", Primer=rownames(VlnPlotA.cDNAM6$data), VlnPlotA.cDNAM6$data)

df_cDNAM1<-data.frame(Sample="cDNAM1", VlnPlotA.cDNAM1$data,Primer=rownames(VlnPlotA.cDNAM1.data))
df_cDNAM2<-data.frame(Sample="cDNAM2", VlnPlotA.cDNAM2$data,Primer=rownames(VlnPlotA.cDNAM2.data))
df_cDNAM3<-data.frame(Sample="cDNAM3", VlnPlotA.cDNAM3$data,Primer=rownames(VlnPlotA.cDNAM3.data))
df_cDNAM4<-data.frame(Sample="cDNAM4", VlnPlotA.cDNAM4$data,Primer=rownames(VlnPlotA.cDNAM4.data))
df_cDNAM5<-data.frame(Sample="cDNAM5", VlnPlotA.cDNAM5$data,Primer=rownames(VlnPlotA.cDNAM5.data))
df_cDNAM6<-data.frame(Sample="cDNAM6", VlnPlotA.cDNAM6$data,Primer=rownames(VlnPlotA.cDNAM6.data))

# Createpair merges
merge1=rbind(df_cDNAM1,df_cDNAM2,df_cDNAM3,df_cDNAM4,df_cDNAM5,df_cDNAM6)

# Combine nmerges
VlnPlotB<-ggplot(merge1, aes(x=Sample, y=nCount_RNA,fill="black")) +  geom_violin() + theme_bw() + scale_fill_manual(values=c("black"))+ guides(fill="none")  + theme(axis.text.x=element_text(angle=90, hjust=1))

# Plot
png(filename=paste(output_dir,"hypotha_VlnPlotA_combined.png",sep=""), width = 24, height = 16, res=800, units = "cm")
plot( grid.arrange(VlnPlotA, VlnPlotB, nrow = 2))
dev.off()

#####################################################################################
# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM1 <- FeatureScatter(cDNAM1.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM1 <- FeatureScatter(cDNAM1.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM1<-plot1.cDNAM1  + plot2.cDNAM1 

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM2 <- FeatureScatter(cDNAM2.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM2 <- FeatureScatter(cDNAM2.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM2<-plot1 + plot2

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM3 <- FeatureScatter(cDNAM3.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM3 <- FeatureScatter(cDNAM3.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM3<-plot1.cDNAM2 + plot2.cDNAM2

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM4 <- FeatureScatter(cDNAM4.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM4 <- FeatureScatter(cDNAM4.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM4<-plot1.cDNAM4 + plot2.cDNAM4

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM5 <- FeatureScatter(cDNAM5.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM5 <- FeatureScatter(cDNAM5.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM5<-plot1.cDNAM5 + plot2.cDNAM5

# FeatureScatter is typically used to visualize feature-feature relationships, but can be used
# for anything calculated by the object, i.e. columns in object metadata, PC scores etc.
plot1.cDNAM6 <- FeatureScatter(cDNAM6.pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt", cols="gray0")
plot2.cDNAM6 <- FeatureScatter(cDNAM6.pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA", cols="gray0")
FeatureScatter_cDNAM6<-plot1.cDNAM6 + plot2.cDNAM6

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter1.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM1)
dev.off()

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter2.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM2)
dev.off()

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter3.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM3)
dev.off()

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter4.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM4)
dev.off()

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter5.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM5)
dev.off()

# Save FeatureScatter
png(filename=paste(output_dir,"hypotha_FeatureScatter6.png",sep=""), width = 24, height = 10, res=600, units = "cm")
plot(FeatureScatter_cDNAM6)
dev.off()

# VlnPlotA.cDNAM1.data
FeatureScatter.cDNAM1.data<-data.frame(Sample="cDNAM1", Primer=rownames(plot2.cDNAM1$data), plot2.cDNAM1$data)
FeatureScatter.cDNAM2.data<-data.frame(Sample="cDNAM2", Primer=rownames(plot2.cDNAM2$data), plot2.cDNAM2$data)
FeatureScatter.cDNAM3.data<-data.frame(Sample="cDNAM3", Primer=rownames(plot2.cDNAM3$data), plot2.cDNAM3$data)
FeatureScatter.cDNAM4.data<-data.frame(Sample="cDNAM4", Primer=rownames(plot2.cDNAM4$data), plot2.cDNAM4$data)
FeatureScatter.cDNAM5.data<-data.frame(Sample="cDNAM5", Primer=rownames(plot2.cDNAM5$data), plot2.cDNAM5$data)
FeatureScatter.cDNAM6.data<-data.frame(Sample="cDNAM6", Primer=rownames(plot2.cDNAM6$data), plot2.cDNAM6$data)

# FeatureScatter
merge1=rbind(FeatureScatter.cDNAM1.data,FeatureScatter.cDNAM2.data,FeatureScatter.cDNAM3.data,FeatureScatter.cDNAM4.data,FeatureScatter.cDNAM5.data,FeatureScatter.cDNAM6.data)

# Combine nmerges
FeatureScatter<-ggplot(merge1, aes(x=nCount_RNA, y=nFeature_RNA,fill=Sample, colour=Sample)) +  geom_point() + theme_bw() + scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"))+ guides(fill="none")  + theme(axis.text.x=element_text(angle=90, hjust=1)) + ggtitle("nCount_RNA-nFeature_RNA relationship")

# Plot
png(filename=paste(output_dir,"hypotha_FeatureScatter.png",sep=""), width = 14, height = 14, res=800, units = "cm")
plot( FeatureScatter)
dev.off()

#####################################################################################
install.packages(c("SeuratObject", "Seurat"))
library(SeuratObject)
library(Seurat)


## Identification of highly variable features (feature selection)
cDNAM1.pbmc <- NormalizeData(cDNAM1.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
cDNAM2.pbmc <- NormalizeData(cDNAM2.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
cDNAM3.pbmc <- NormalizeData(cDNAM3.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
cDNAM4.pbmc <- NormalizeData(cDNAM4.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
cDNAM5.pbmc <- NormalizeData(cDNAM5.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
cDNAM6.pbmc <- NormalizeData(cDNAM6.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
aggregate.pbmc <- NormalizeData(aggregate.pbmc, normalization.method = "LogNormalize", scale.factor = 10000)

## pbmc
## I have tried to use FindVariableFeatures
## but only applied to object_scale_data not to cDNAM1.pbmc
cDNAM1.varialble <- FindVariableFeatures(object=cDNAM1.pbmc , selection.method = "vst")
cDNAM2.varialble <- FindVariableFeatures(object=cDNAM2.pbmc , selection.method = "vst")
cDNAM3.varialble <- FindVariableFeatures(object=cDNAM3.pbmc , selection.method = "vst")
cDNAM4.varialble <- FindVariableFeatures(object=cDNAM4.pbmc , selection.method = "vst")
cDNAM5.varialble <- FindVariableFeatures(object=cDNAM5.pbmc , selection.method = "vst")
cDNAM6.varialble <- FindVariableFeatures(object=cDNAM6.pbmc , selection.method = "vst")
aggregate.varialble <- FindVariableFeatures(object=aggregate.pbmc , selection.method = "vst")

## pbmc
library("Matrix")

# Identify the 10 most highly variable genes
top10.cDNAM1 <- head(VariableFeatures(cDNAM1.varialble), 10)
top10.cDNAM2 <- head(VariableFeatures(cDNAM2.varialble), 10)
top10.cDNAM3 <- head(VariableFeatures(cDNAM3.varialble), 10)
top10.cDNAM4 <- head(VariableFeatures(cDNAM4.varialble), 10)
top10.cDNAM5 <- head(VariableFeatures(cDNAM5.varialble), 10)
top10.cDNAM6 <- head(VariableFeatures(cDNAM6.varialble), 10)
top10.aggregate <- head(VariableFeatures(aggregate.pbmc), 10)

# plot variable features with and without labels
library("ggplot2")
plot1.cDNAM1 <- VariableFeaturePlot(cDNAM1.varialble) + theme(legend.position="none")
plot2.cDNAM1 <- LabelPoints(plot = plot1.cDNAM1, points = top10.cDNAM1, repel = TRUE)
cDNAM1.plot <- plot1.cDNAM1 + plot2.cDNAM1

plot1.cDNAM2 <- VariableFeaturePlot(cDNAM2.varialble) + theme(legend.position="none")
plot2.cDNAM2 <- LabelPoints(plot = plot1.cDNAM2, points = top10.cDNAM2, repel = TRUE)
cDNAM2.plot <- plot1.cDNAM2 + plot2.cDNAM2

plot1.cDNAM3 <- VariableFeaturePlot(cDNAM3.varialble) + theme(legend.position="none")
plot2.cDNAM3 <- LabelPoints(plot = plot1.cDNAM3, points = top10.cDNAM3, repel = TRUE)
cDNAM3.plot <- plot1.cDNAM3 + plot2.cDNAM3

plot1.cDNAM4 <- VariableFeaturePlot(cDNAM4.varialble) + theme(legend.position="none")
plot2.cDNAM4 <- LabelPoints(plot = plot1.cDNAM4, points = top10.cDNAM4, repel = TRUE)
cDNAM4.plot <- plot1.cDNAM4 + plot2.cDNAM4

plot1.cDNAM5 <- VariableFeaturePlot(cDNAM5.varialble) + theme(legend.position="none")
plot2.cDNAM5 <- LabelPoints(plot = plot1.cDNAM5, points = top10.cDNAM5, repel = TRUE)
cDNAM5.plot <- plot1.cDNAM5 + plot2.cDNAM5

plot1.cDNAM6 <- VariableFeaturePlot(cDNAM6.varialble) + theme(legend.position="none")
plot2.cDNAM6 <- LabelPoints(plot = plot1.cDNAM6, points = top10.cDNAM6, repel = TRUE)
cDNAM6.plot <- plot1.cDNAM6 + plot2.cDNAM6

plot1.aggregate <- VariableFeaturePlot(aggregate.pbmc) + theme(legend.position="none")
plot2.aggregate <- LabelPoints(plot = plot1.aggregate , points = top10.aggregate, repel = TRUE)
aggregate.plot <- plot1.aggregate + plot2.aggregate


# Save FeatureScatter
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM1.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM1.plot)
dev.off()

# Save FeatureScatter
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM2.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM2.plot)
dev.off()

# Save FeatureScatter
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM3.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM3.plot)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM4.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM4.plot)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM5.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM5.plot)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.cDNAM6.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(cDNAM6.plot)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_FindVariableFeatures.aggregate.png",sep=""), width = 14, height = 9, res=600, units = "cm")
plot(aggregate.plot)
dev.off()

#####################################################################################
## Perform linear dimensional reduction
cDNAM1.pbmc <- RunPCA(cDNAM1.pbmc, features = VariableFeatures(object = cDNAM1.varialble))
cDNAM2.pbmc <- RunPCA(cDNAM2.pbmc, features = VariableFeatures(object = cDNAM2.varialble))
cDNAM3.pbmc <- RunPCA(cDNAM3.pbmc, features = VariableFeatures(object = cDNAM3.varialble))
cDNAM4.pbmc <- RunPCA(cDNAM4.pbmc, features = VariableFeatures(object = cDNAM4.varialble))
cDNAM5.pbmc <- RunPCA(cDNAM5.pbmc, features = VariableFeatures(object = cDNAM5.varialble))
cDNAM6.pbmc <- RunPCA(cDNAM6.pbmc, features = VariableFeatures(object = cDNAM6.varialble))
aggregate.pbmc <- RunPCA(aggregate.pbmc, features = VariableFeatures(object = aggregate.varialble))
#####################################################################################
## Perform linear dimensional reduction
plot1.cDNAM1 <- VizDimLoadings(cDNAM1.pbmc, dims = 1:2, reduction = "pca") 
plot1.cDNAM2 <- VizDimLoadings(cDNAM2.pbmc, dims = 1:2, reduction = "pca") 
plot1.cDNAM3 <- VizDimLoadings(cDNAM3.pbmc, dims = 1:2, reduction = "pca")
plot1.cDNAM4 <- izDimLoadings(cDNAM4.pbmc, dims = 1:2, reduction = "pca") 
plot1.cDNAM5 <- VizDimLoadings(cDNAM5.pbmc, dims = 1:2, reduction = "pca")
plot1.cDNAM6 <- VizDimLoadings(cDNAM6.pbmc, dims = 1:2, reduction = "pca")
aggregate.pbmc <- VizDimLoadings(aggregate.pbmc , dims = 1:2, reduction = "pca")
#####################################################################################
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM1.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM1)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM2.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM2)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM3.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM3)
dev.off()

## Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM4.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM4)
dev.off()

## Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM5.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM5)
dev.off()

## Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.cDNAM6.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM6)
dev.off()
## Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_VizDimLoadings.aggregate.png",sep=""), width = 24, height = 16, res=600, units = "cm")
	## Create plot
	plot(aggregate.pbmc)
dev.off()

#####################################################################################
# Perform linear dimensional reduction
plot1.cDNAM1 <-  DimPlot(cDNAM1.pbmc, reduction = "pca") + ggtitle("cDNAM1") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.cDNAM2 <-  DimPlot(cDNAM2.pbmc, reduction = "pca") + ggtitle("cDNAM2") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.cDNAM3 <-  DimPlot(cDNAM3.pbmc, reduction = "pca") + ggtitle("cDNAM3") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.cDNAM4 <-  DimPlot(cDNAM4.pbmc, reduction = "pca") + ggtitle("cDNAM4") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.cDNAM5 <-  DimPlot(cDNAM5.pbmc, reduction = "pca") + ggtitle("cDNAM5") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.cDNAM6 <-  DimPlot(cDNAM6.pbmc, reduction = "pca") + ggtitle("cDNAM6") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))
plot1.aggregate <-  DimPlot(aggregate.pbmc, reduction = "pca") + ggtitle("aggregate all 6 samples") + theme(legend.position = "none")  + scale_color_manual(values=c("black"))

#####################################################################################
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM1.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM1)
dev.off()

#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM2.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM2)
dev.off()

# Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM3.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM3)
dev.off()


# Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM4.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM4)
dev.off()


# Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM5.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM5)
dev.off()

# Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.cDNAM6.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.cDNAM6)
dev.off()

# Perform linear dimensional reduction
#filename="/home/felipe/Downloads/snRNASeq_out/out/"
png(filename=paste(output_dir,"hypotha_DimPlot.aggregate.png",sep=""), width = 12, height = 12, res=600, units = "cm")
	## Create plot
	plot(plot1.aggregate)
dev.off()

#####################################################################################
# cDNAM1.DimHeatma
png(filename=paste(output_dir,"cDNAM1.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM1.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# cDNAM2.DimHeatma
png(filename=paste(output_dir,"cDNAM2.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM2.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# cDNAM3.DimHeatma
png(filename=paste(output_dir,"cDNAM3.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM3.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# cDNAM4.DimHeatma
png(filename=paste(output_dir,"cDNAM4.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM4.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# cDNAM5.DimHeatma
png(filename=paste(output_dir,"cDNAM5.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM5.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# cDNAM6.DimHeatmap
png(filename=paste(output_dir,"cDNAM6.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(cDNAM6.pbmc, dims = 1, cells = 500, balanced = TRUE) 
dev.off()

# aggregate.DimHeatmap
png(filename=paste(output_dir,"aggregate.DimHeatmap.png",sep=""), width = 12, height = 12, res=800, units = "cm")
	DimHeatmap(aggregate.pbmc, dims = 1, cells = 500, balanced = TRUE)
dev.off()

#####################################################################################
# Determine the ‘dimensionality’ of the dataset
cDNAM1.pbmc <- RunUMAP(cDNAM1.pbmc, dims = 1:30)
cDNAM2.pbmc <- RunUMAP(cDNAM2.pbmc, dims = 1:30)
cDNAM3.pbmc <- RunUMAP(cDNAM3.pbmc, dims = 1:30)
cDNAM4.pbmc <- RunUMAP(cDNAM4.pbmc, dims = 1:30)
cDNAM5.pbmc <- RunUMAP(cDNAM5.pbmc, dims = 1:30)
cDNAM6.pbmc <- RunUMAP(cDNAM6.pbmc, dims = 1:30)
aggregate.pbmc <- RunUMAP(aggregate.pbmc, dims = 1:30)

# Plot
p1.DimPlot <- DimPlot(cDNAM1.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM1")
p2.DimPlot <- DimPlot(cDNAM2.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM2")
p3.DimPlot <- DimPlot(cDNAM3.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM3")
p4.DimPlot <- DimPlot(cDNAM4.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM4")
p5.DimPlot <- DimPlot(cDNAM5.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM5")
p6.DimPlot <- DimPlot(cDNAM6.pbmc, label = TRUE) + NoLegend() + ggtitle("cDNAM6")
aggregate.DimPlot <- DimPlot(aggregate.pbmc, label = TRUE) + NoLegend() + ggtitle("aggregate")


# Save
save(p1.DimPlot, p2.DimPlot, p3.DimPlot, file = "DimPlot123.RData")
save(p4.DimPlot, p5.DimPlot, file = "DimPlot45.RData")
save(p6.DimPlot, file = "DimPlot6.RData")
save(aggregate.pbmc, file = "DimPlotaggregate.RData")


load(file = "DimPlot6.RData")
load(file = "DimPlot123.RData")
load(file = "DimPlot45.RData")
load(file = "DimPlotaggregate.RData")

# aggregate.DimHeatmap
png(filename=paste(output_dir,"RunUMAP.DimPlot.png",sep=""), width = 16, height = 12, res=800, units = "cm")
	plot( grid.arrange(p1.DimPlot, p2.DimPlot, p3.DimPlot,p4.DimPlot,p5.DimPlot, nrow = 2,ncol=3))
dev.off()

# aggregate.DimHeatmap
png(filename=paste(output_dir,"RunUMAP.DimPlot.png",sep=""), width = 16, height = 16, res=800, units = "cm")
	plot(aggregate.pbmc)
dev.off()

#####################################################################################
library(celldex)
library(SingleR)
library(dplyr)
library(Seurat)
library(patchwork)
library(gridExtra)
library(ggplot2)
library(SeuratObject)
library(Seurat)

#####################################################################################
# DatabaseImmuneCellExpressionData

# The DICE reference consists of bulk RNA-seq samples of sorted cell populations from the project of the same name (Schmiedel et al. 2018).

# MouseRNAseqData

# This reference consists of a collection of mouse bulk RNA-seq data sets downloaded from the gene expression omnibus (Benayoun et al. 2019). A variety of cell types are available, again mostly from blood but also covering several other tissues.

# ImmGenData

# The ImmGen reference consists of microarray profiles of pure mouse immune cells from the project of the same name (Heng et al. 2008). This is currently the most highly resolved immune reference - possibly overwhelmingly so, given the granularity of the fine labels.

#####################################################################################
output_dir="./"

# Calulate predicted annotation
MouseRNAseqData <- MouseRNAseqData()
ImmGenData <- ImmGenData()
DatabaseImmuneCellExpressionData <- celldex::DatabaseImmuneCellExpressionData()

# DataFrame with all samples and files with samples
df_samples_file=data.frame(Samples=c("cDNAM1","cDNAM2","cDNAM3","cDNAM4","cDNAM5","cDNAM6","aggregate.pbmc"),Files=c("DimPlot1.RData","DimPlot2.RData","DimPlot3.RData","DimPlot4.RData","DimPlot5.RData","DimPlot6.RData","aggregate.RData"))

# Set sample ID
sample_ID=1

# Take samples and files
sample=df_samples_file[sample_ID,"Samples"]
file=df_samples_file[sample_ID,"Files"]

# Load file
load(file = file)

pbmc=aggregate.pbmc

# Calculate UMAP
pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
pbmc.varialble <- FindVariableFeatures(object=pbmc , selection.method = "vst")
pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc.varialble))
pbmc <- RunUMAP(pbmc, dims = 1:30)

# Annotate celltype
aggregate.MouseRNAseqData.pbmc <- SingleR(test=GetAssayData(pbmc, assay = "RNA", slot = "data"), ref=MouseRNAseqData, labels=MouseRNAseqData$label.main)
aggregate.ImmGenData.pbmc      <- SingleR(test=GetAssayData(pbmc, assay = "RNA", slot = "data"), ref=ImmGenData, labels=ImmGenData$label.main)
aggregate.DatabaseImmuneCellExpressionData.pbmc <- SingleR(test=GetAssayData(pbmc, assay = "RNA", slot = "data"), ref=DatabaseImmuneCellExpressionData, labels=DatabaseImmuneCellExpressionData$label.main)

pbmc[["predicted.MouseRNAseqData"]] <- aggregate.MouseRNAseqData.pbmc$labels
pbmc[["predicted.ImmGenData"]] <- aggregate.ImmGenData.pbmc$labels
pbmc[["predicted.DatabaseImmuneCellExpressionData"]] <- aggregate.DatabaseImmuneCellExpressionData.pbmc$labels

# Calculate plots
pbmc.DimPlot   <- DimPlot(pbmc, label = TRUE) + NoLegend() + ggtitle("aggregate all 6 samples") + theme_bw()
pbmc.anontated <- DimPlot(pbmc, group.by = c("predicted.MouseRNAseqData"),label=TRUE ) + theme_bw() +ggtitle("predicted.MouseRNAseqData")
pbmc.anontated2 <- DimPlot(pbmc, group.by = c("predicted.ImmGenData"),label=TRUE ) + theme_bw()+ggtitle("predicted.ImmGenData")
pbmc.anontated3 <- DimPlot(pbmc, group.by = c("predicted.DatabaseImmuneCellExpressionData"),label=TRUE ) + theme_bw()+ggtitle("predicted.DatabaseImmuneCellExpressionData")

# aggregate.DimHeatmap
png(filename=paste(output_dir,"singleR.aggregate.png",sep=""), width = 32, height = 24, res=600, units = "cm")
	plot( grid.arrange(pbmc.DimPlot, pbmc.anontated,pbmc.anontated2,pbmc.anontated3, nrow = 2,ncol=2))
dev.off()


#####################################################################################
# library("Azimuth")
library(Seurat)
library(Azimuth)
library(SeuratData)
library(patchwork)

# The RunAzimuth function can take a Seurat object as input
aggregate.pbmc.azimuth <- RunAzimuth(aggregate.pbmc, reference = "pbmcref")

DimPlot(aggregate.pbmc.azimuth, label = TRUE) + NoLegend() + ggtitle("aggregate")

p1 <- DimPlot(aggregate.pbmc.azimuth, group.by = "predicted.celltype.l1", label = TRUE, label.size = 3) + NoLegend()
p2 <- DimPlot(aggregate.pbmc.azimuth)
p1 + p2


