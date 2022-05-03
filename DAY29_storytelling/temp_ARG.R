# Mean temperatures in Argentina

# Library
library(tidyverse)
library(ggridges)

# Dataset
temp = read.csv("meantemp_ARG.csv", header=T)


# By region

png("meantemp_ARGregions.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(temp, aes(x = mean_temperature, y = reorder(region, mean_province), fill = ..x..)) +  
  #..x.., a ggplot trick that tells it to use the variable we mapped to the x-axis
  geom_density_ridges_gradient(quantile_lines = TRUE, quantiles = 2, bandwidth = 1) +
  scale_fill_viridis_c(option = "plasma") +
  labs(x = "Mean temperatures (°C)", y = NULL, color = "Temp",
       title="Mean temperatures registered in Argentina regions between 1901-2020",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "none",
        text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30),
        plot.margin = unit(c(1,1,1,1), "cm"))

dev.off()

# By province

png("meantemp_ARGprovinces.png", units="in", width=30, height=20, res=300, bg="transparent")

ggplot(temp, aes(x = mean_temperature, y = reorder(province, mean_province), fill = ..x..)) +  
  #..x.., a ggplot trick that tells it to use the variable we mapped to the x-axis
  geom_density_ridges_gradient(quantile_lines = TRUE, quantiles = 2, bandwidth = 0.2) +
  scale_fill_viridis_c(option = "plasma") +
  labs(x = "Mean temperatures (°C)", y = NULL, color = "Temp",
       title="Mean temperatures registered in Argentina provinces between 1901-2020",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "none",
        text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30),
        plot.margin = unit(c(1,1,1,1), "cm"))

dev.off()


################################
# Max temperatures in Argentina

# Library
library(tidyverse)
library(ggridges)

# Dataset
temp = read.csv("maxtemperature_ARG.csv", header=T)


# By region

png("maxtemp_ARGregions.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(temp, aes(x = max_temperature, y = reorder(region, mean_province), fill = ..x..)) +  
  #..x.., a ggplot trick that tells it to use the variable we mapped to the x-axis
  geom_density_ridges_gradient(quantile_lines = TRUE, quantiles = 2, bandwidth = 1) +
  scale_fill_viridis_c(option = "plasma") +
  labs(x = "Maximum temperatures (°C)", y = NULL, color = "Temp",
       title="Maximum temperatures registered in Argentina regions between 1901-2020",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "none",
        text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30),
        plot.margin = unit(c(1,1,1,1), "cm"))

dev.off()

# By province

png("maxtemp_ARGprovinces.png", units="in", width=30, height=20, res=300, bg="transparent")

ggplot(temp, aes(x = max_temperature, y = reorder(province, mean_province), fill = ..x..)) +  
  #..x.., a ggplot trick that tells it to use the variable we mapped to the x-axis
  geom_density_ridges_gradient(quantile_lines = TRUE, quantiles = 2, bandwidth = 0.2) +
  scale_fill_viridis_c(option = "plasma") +
  labs(x = "Maximum temperatures (°C)", y = NULL, color = "Temp",
       title="Maximum temperatures registered in Argentina provinces between 1901-2020",
       caption="@melisadigiacomo\nDAY29 #30DayChartChallenge April 2022") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.position = "none",
        text = element_text(size = 30),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30),
        plot.margin = unit(c(1,1,1,1), "cm"))

dev.off()


# Formosa the hottest province


formosa = read.csv("maxtemperature_formosa.csv", header=T)

ggplot(formosa, aes(x = max_temperature)) +
  geom_density(fill= "#f3da2b", alpha = 0.9) +
  facet_wrap(vars(reorder(month, order))) +
  labs(x = "Maximum temperatures (°C)", y = "density", color = "Temp",
       title="Maximum temperatures in Formosa by month registered between 1901-2020") +
  theme_bw()