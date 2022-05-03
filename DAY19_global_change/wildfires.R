# Climate change

# Library
library(dplyr)
library(ggplot2)

# Dataset
wildfires = read.csv("wildfires_USA.csv", header=T)
wildfires <- wildfires %>%
  mutate(damage=factor(damage,levels=c("Increased Greenness", "Unburned", "Low", "Moderate", "High"))) %>% 
  mutate(values = values/1e6)


# Plot

png("wildfires.png", units="in", width=25, height=15, res=300, bg="transparent")

ggplot(wildfires, aes(x=year, values)) +
  geom_area(aes(fill = damage)) + 
  scale_fill_manual(values=c("#005a32", "#74c476", "#fed976", "#f16913", "#de2d26")) +
  xlab("") +
  ylab("Area burned (million acres)") +
  labs(title="USA WILDFIRES DAMAGES",
       caption="@melisadigiacomo\nDAY19 #30DayChartChallenge April 2022") +
  scale_x_continuous(limits = c(1984, 2018), breaks = c(1984, 1990, 2000, 2010, 2018), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0, 10), breaks = c(2.5, 5, 7.5, 10), expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "bottom",
        text = element_text(size = 40),
        axis.title = element_text(size = 40),
        axis.text = element_text(size = 40),
        plot.margin = unit(c(3,3,3,3), "cm"))

dev.off()