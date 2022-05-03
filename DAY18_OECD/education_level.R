# Education level

# Libraries
library(ggplot2)

# Dataset
education = read.csv("level.csv", header=T)

#Plot
png("education_level1.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(education, aes(x= value, y= reorder(location, value))) +
  geom_line(aes(group = location), colour="gray", size  = 20) +
  geom_point(aes(color = level), size = 20) +
  xlab("% of 25-64 year-olds") + ylab("") +
  labs(title="EDUCATION LEVEL",
       caption="@melisadigiacomo\nDAY18 #30DayChartChallenge April 2022") +
  scale_color_manual(values=c("#FC766AFF", "#184A45FF")) +
  theme_minimal() +
  theme(legend.position = "top",
        text = element_text(size = 35),
        axis.title = element_text(size = 35),
        axis.text = element_text(size = 35),
        plot.margin = unit(c(1,1,1,1), "cm"),
        panel.background = element_rect(fill = "transparent"),
        legend.background=element_blank(),
        plot.background = element_rect(fill = "transparent", colour = NA))

dev.off()