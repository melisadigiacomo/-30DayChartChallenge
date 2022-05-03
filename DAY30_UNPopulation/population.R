# Population by age in 2100

# Library
library(dplyr)
library(ggplot2)

# Dataset
pop = read.csv("population_age_2100.csv", header=T)
pop <- pop %>% 
  mutate(Pop_2100 = Pop_2100/1e3)

# Add a flag
pop = mutate(pop, group=ifelse(pop$Age <= 15, "Child", ifelse(pop$Age >= 16 & pop$Age <= 65, "Middle age", "Senior")))

# Plot

png("populationbyage.png", units="in", width=25, height=15, res=300, bg="transparent")

ggplot(pop, aes(x=Age, y=Pop_2100)) +
  geom_area(aes(fill = group)) + 
  scale_fill_manual(values=c("#96cacc", "#ffb66b", "#ff9891")) +
  xlab("Age") +
  ylab("Estimates (thousands)") +
  labs(title="Estimated world population by age in 2100",
       caption="@melisadigiacomo\nDAY30 #30DayChartChallenge April 2022") +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, 10), expand = c(0, 0)) +
  scale_y_continuous(breaks = c(200, 400, 600), expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "bottom",
        text = element_text(size = 40),
        axis.title = element_text(size = 40),
        axis.text = element_text(size = 40),
        plot.margin = unit(c(3,3,3,3), "cm"))

dev.off()