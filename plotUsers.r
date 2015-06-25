Sys.setlocale("LC_TIME","en_US.utf8") # use US time format

# first, load the data
users <- read.table("users.txt", sep="\t")
# transform strings into proper time format
users$V2 <- strptime(users$V2, format="%d.%m.%Y %H:%M")

# old school plotting
# plot x-axis manually later
png("users.png")
plot(users$V2, users$V1, type="l", ylab="Amount of user-accounts",xlab="Time", xaxt="n")
dmin <- min(users$V2)
dmax <- max(users$V2)
dminjan <- as.POSIXct(format(dmin, "%Y-1-1"))
seqYear <- seq(dminjan, by = "1 month", to = dmax + (86400 * 365)) # some padding to the x-axis
# new x-axis
axis(1, at = seqYear, labels = format(seqYear, "%b-%y"), las = 1)
dev.off()

library("xkcd") # loads ggplot too
# ggplot plotting
users <- as.data.frame(users)
a <- ggplot(data=users, aes(x=V2, y=V1))
a <- a + geom_line()
a <- a + geom_point()
a <- a + xlab("Time") + ylab("Number user accounts")
ggsave("users2.png", a)

# xkcd style plotting
# randomness is used in xkcd graphs, set seed for reproducibility
set.seed(123)
xrange <- range(users$V2)
#yrange <- range(users$V1)
# this currently goes to 3800, I want 4000
yrange <- c(0, 4000)
p <- ggplot() + 
        geom_point(aes(x=as.Date(V2),y=V1), data=users) + 
        xkcdaxis(xrange,yrange) +
        ylab("Number of user accounts") +
        xlab("Time")
ggsave("users3.png",p)
