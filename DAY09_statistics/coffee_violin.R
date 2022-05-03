# Violin plot

# Libraries
library(ggpubr)
library(ggplot2)
library(agricolae)

# Seed
set.seed(2021)

## Read dataset
data = read.csv('coffee_countries.csv', header=1)
data <- data %>%
  mutate(country_of_origin=factor(country_of_origin,levels=c("Ethiopia", "Colombia", "Indonesia", "Brazil", "Vietnam")))

# Shapiro test
shapiro.test(data$aroma)
# W = 0.90358, p-value = 6.793e-15

# Kruskal-Wallis
kruskal.test(data$aroma, data$country_of_origin)
# Kruskal-Wallis chi-squared = 52.654, df = 4, p-value = 1.007e-10

# Kruskal-Wallis with multiple comparisons
outKruskal<-with(data,kruskal(aroma,country_of_origin,group=TRUE, alpha = 0.05, main="data", console=TRUE))

# Violin plot

png("violinplot.png", units="in", width=12, height=8, res=300, bg="transparent")

ggviolin(data, x = "country_of_origin", y = "aroma", fill = "country_of_origin", 
         palette = c("#D7B7A3", "#985E49", "#F2AD59", "#432D27", "#C6978E"),
         add = "boxplot", add.params = list(color = "black", fill = "white"),
         lwd=1.5, shape = "species") +
  labs(title="COFFEE AROMA",
       caption="@melisadigiacomo\nDAY09 #30DayChartChallenge April 2022") +
  annotate("text", x = 1:2, y = 9.5:8.5, label = c("a", "b"), size = 7) +
  annotate("text", x = 3:4, y = 9, label = c("b", "c"), size = 7) +
  annotate("text", x = 5, y = 8.8, label = "c", size = 7) +
  annotate("text", x = 4, y = 5.2, label = "Kruskal-Wallis test (H= 52.654, p-value = 1.007e-10",  size = 6) +
  annotate("text", x = 4, y = 5, label = "Different letters show countries with significant differences (??=5%)", size = 6) +
  theme_classic() +
  theme(text = element_text(size=20),
        legend.position="none",
        axis.title = element_blank())

dev.off()