#install.packages("gplots")
#library(gplots)

df <- read.csv(file="survey_presets_frequencies_2-tailed_p-values_coded.csv",sep=",",row.names=1)
pdf("survey_heatmap_p-values_2-tailed_coded_RG_white.pdf",width=20,height=20)
p <- heatmap.2(as.matrix(df),
               col=colorRampPalette(c("red","white","green4"))(3),
               na.color="grey",
               trace="none",
               sepwidth=c(0.005,0.005),
               sepcolor="grey",
               colsep=1:ncol(df),
               rowsep=1:nrow(df),
               srtRow=0,
               adjRow=c(0, 1))
dev.off()
