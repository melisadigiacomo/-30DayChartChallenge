# Tomato flavor

# Libraries
library(ggplot2)
library(geomtextpath)

# Dataset
tomato = read.csv('tomato.csv', header=1)

# Plots

# Citric acid by botanical variety

png("citric.png", units="in", width=10, height=7, res=300)

ggplot(tomato, aes(x = citric_acid, colour = botanical_variety, label = botanical_variety)) +
  geom_textdensity(size = 6, fontface = 2, hjust = 0.2, vjust = 0.33) +
  labs(title="Citric acid content in different tomato botanical varieties",
       caption="@melisadigiacomo\nDAY08 #30DayChartChallenge April 2022") +
  xlab("Citric Acid") + ylab("Density") +
  scale_colour_manual(values = c("#fc9272", "#de2d26", "#a50f15")) +
  theme_classic() + theme(legend.position = "none", axis.text = element_text(size = 20), text = element_text(size = 20))

dev.off()


# Fructose by botanical variety

png("fructose.png", units="in", width=10, height=7, res=300)

ggplot(tomato, aes(x = fructose, colour = botanical_variety, label = botanical_variety)) +
  geom_textdensity(size = 6, fontface = 2, hjust = 0.15, vjust = 0.2) +
  labs(title="Fructose content in different tomato botanical varieties",
       caption="@melisadigiacomo\nDAY08 #30DayChartChallenge April 2022") +
  xlab("Fructose") + ylab("Density") +
  scale_colour_manual(values = c("#fc9272", "#de2d26", "#a50f15")) +
  theme_classic() + theme(legend.position = "none", axis.text = element_text(size = 20), text = element_text(size = 20))

dev.off()