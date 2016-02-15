library(ggplot2)
library(ggthemes)

genotype <- read.csv(file="genotypenumber.csv",sep="\t",head=F)
genotype$date <- as.POSIXct(as.character(genotype$V2),format="%d.%m.%Y %H:%M")
ggplot(genotype,aes(genotype$date,genotype$V1)) + geom_smooth() + theme_light() + scale_x_datetime("Date") + scale_y_continuous("# of Genotypes")
ggsave("genotypes.pdf")
