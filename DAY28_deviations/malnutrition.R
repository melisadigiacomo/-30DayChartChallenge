# Malnutrition

# Library
library(dplyr)
library(ggplot2)

# Dataset
data = read.csv("country-wise-average.csv", header=T)

weight <- subset(data, select=c("Country", "Underweight", "Overweight"))
weight = na.omit(weight)

# Calculate deviations from global mean value
weight$underweight_deviation <-  weight$Underweight - mean(weight$Underweight, na.rm = TRUE)
weight$overweight_deviation <-  weight$Overweight - mean(weight$Overweight, na.rm = TRUE)

# Underweight global mean value
mean(weight$Underweight)
# 13.6%

# Overweight global mean value
mean(weight$Overweight)
# 7.2%

# Selected countries
countries <- c("ARGENTINA", "BOLIVIA", "URUGUAY", "PARAGUAY", "COLOMBIA",
                "CHILE", "VENEZUELA", "PERU", "BRAZIL", "ECUADOR", "TRINIDAD AND TOBAGO",
                "SURINAME", "SOUTH SUDAN", "TOGO", "UGANDA", "UNITED REPUBLIC OF TANZANIA",
               "ZAMBIA", "NIGERIA", "NIGER", "EGYPT", "MALI", "NAMBIA", "MOROCCO", "ANGOLA", "ARGELIA")
weight_countries = filter(weight, Country %in% countries)


# Add flags for color
weight_countries = mutate(weight_countries , flag_overweight=ifelse(weight_countries$overweight_deviation < 0, "negativo","positivo"))
weight_countries = mutate(weight_countries , flag_underweight=ifelse(weight_countries$underweight_deviation < 0, "negativo","positivo"))

# Butterfly plot underweight
ggplot(weight_countries, aes(x = reorder(Country, -underweight_deviation), y = underweight_deviation, fill = flag_underweight)) +   
  geom_bar(stat = "identity", width = .6) +
  xlab("") + ylab("Underweight deviations") +
  labs(title="UNDERWEIGHT DEVIATIONS FROM GLOBAL MEAN",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = .5), 
        axis.ticks = element_blank(),
        legend.position = "none") + 
  scale_fill_manual(values=c("#b2abd2", "#fdb863")) 

# Butterfly plot overweight
ggplot(weight_countries, aes(x = reorder(Country, -underweight_deviation), y = overweight_deviation, fill = flag_overweight)) +   
  geom_bar(stat = "identity", width = .6) +
  xlab("") + ylab("Overweight deviations") +
  labs(title="OVERWIEGHT DEVIATIONS FROM GLOBAL MEAN",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = .5), 
        axis.ticks = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values=c("#8073ac", "#e08214"))



png("underweight_deviations.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(weight_countries, aes(x = reorder(Country, -underweight_deviation), y = underweight_deviation, fill = flag_underweight)) +   
  geom_bar(stat = "identity", width = .6) +
  coord_flip() +
  xlab("") + ylab("Underweight deviations") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = .5), 
        axis.ticks = element_blank(),
        legend.position = "none",
        text = element_text(size = 30),
        axis.text = element_text(size = 30)) + 
  scale_fill_manual(values=c("#999999", "#ef8a62")) 

dev.off()