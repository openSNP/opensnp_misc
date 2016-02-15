library(ggplot2)
library(ggthemes)
library(reshape2)

# get genotypes
genotype <- read.csv(file="genotypenumber.csv",sep="\t",head=F)
genotype$date <- as.POSIXct(as.character(genotype$V2),format="%d.%m.%Y %H:%M")

#get users
user <- read.csv(file="usernumber.csv",sep="\t",head=F)
user$date <- as.POSIXct(as.character(user$V2),format="%d.%m.%Y %H:%M")

# nicer column labels
user$usernumber <- user$V1
genotype$genotypenumber <- genotype$V1

# merge DFs and drop useless columns
merged <- merge(user,genotype,by="date")
merged$V1.x <- NULL
merged$V1.y <- NULL
merged$V2.y <- NULL
merged$V2.x <- NULL

# convert from wide to long
merged_long <- melt(merged, id.vars="date",variable.name="category")

# plot graphs
ggplot(merged_long,aes(merged_long$date,merged_long$value,color=merged_long$category)) + geom_smooth() + scale_color_discrete("Category") + scale_x_datetime("Date") + scale_y_continuous("total #") + theme_minimal()
ggsave("genotypes_users.pdf")
