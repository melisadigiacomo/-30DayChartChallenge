# Gas emissions

# Library
library(ggplot2)
library(scales)

# Dataset
gases = read.csv("emissions.csv", header=T)

# Plot

png("emissions.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(gases, aes(x=gas, y=emissions, fill=as.factor(year))) +
  geom_bar(stat="identity", color="black", position=position_dodge()) +
  geom_text(aes(label=year), vjust=-1, color="black",
            position = position_dodge(0.9), size=10) +
  xlab("") + ylab("Gas emissions (billion metric tons CO2 equivalents)") + 
  labs(title="GLOBAL GREENHOUSE GAS EMISSIONS",
       caption="@melisadigiacomo\nDAY16 #30DayChartChallenge April 2022") +
  scale_fill_brewer(palette="Greys") +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-3), limits = c(0, 40000),
                     breaks = c(10000, 20000, 30000, 40000), expand = c(0, 0)) +
  theme_classic() + 
  theme(legend.position = "none", text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30),
        plot.margin = unit(c(1,1,1,1), "cm"),
        panel.background = element_rect(fill = "transparent"),
        plot.background = element_rect(fill = "transparent", colour = NA))

dev.off()