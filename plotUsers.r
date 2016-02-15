library(ggplot2)
library(ggthemes)

user <- read.csv(file="usernumber.csv",sep="\t",head=F)
user$date <- as.POSIXct(as.character(user$V2),format="%d.%m.%Y %H:%M")
ggplot(user,aes(user$date,user$V1)) + geom_smooth() + theme_light() + scale_x_datetime("Date") + scale_y_continuous("# of users")
ggsave("users.pdf")
