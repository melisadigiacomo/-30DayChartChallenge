# Sea level

library(ggplot2)

sea = read.csv("epa_sea_level.csv", header=T)


ggplot(sea, aes(x=year,y=level)) +
  #stat_smooth(method="loess", span=0.1, se=TRUE, aes(fill="blue"), alpha=0.3) +
  theme_bw()

png("sea_level.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(sea, aes(x = year, y = level)) +
  geom_line(color= "blue", size = 1) +
  #geom_smooth(method=lm, se=FALSE, col='black', size = 1) + #add linear trend line
  geom_ribbon(aes(ymin = lower_error,
                  ymax = upper_error), fill = "blue", alpha = 0.2) +
  xlab("") + ylab("Cumulative Sea Level Change (inches)") +
  theme_bw() +
  theme(text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30))

dev.off()