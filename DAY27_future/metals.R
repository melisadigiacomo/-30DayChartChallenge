# Metals: future prices

# Library
library(ggplot2)

# Dataset
metals = read.csv("metals.csv", header=T)

# date format
metals$date <- as.Date(metals$date, format = "%m/%d/%Y")
str(metals)

# Basic line plot with points
png("priceforecast.png", units="in", width=25, height=15, res=300)

ggplot(data=metals, aes(x=date, y=average_price, group=metal, fill=metal)) +
  geom_line(aes(color=metal), size = 2) +
  geom_ribbon(aes(ymin = minimum_price,
                  ymax = maximum_price), alpha = 0.3) +
  scale_color_manual(values = c("#E4F00A", "#e88809")) + 
  scale_fill_manual(values = c("#E4F00A", "#e88809")) + 
  scale_x_date(date_labels = "%m/%Y", date_breaks = '1 month', expand = c(0,0)) +
  scale_y_continuous(limits = c(1500, 3100)) +
  labs(title="Price Forecast",
       caption="@melisadigiacomo\nDAY27 #30DayChartChallenge April 2022") +
  theme(
    # Panel grids
    panel.grid.minor = element_blank(),
    panel.grid = element_line(color = "#EBEBEB50"),
    # Change plot and panel background
    plot.background = element_rect(fill = "black"),
    panel.background = element_rect(fill = 'black'),
    # Change legend 
    legend.position = c(0.5, 0.09),
    legend.direction = "horizontal",
    legend.background = element_rect(fill = "black", color = NA),
    legend.key = element_rect(color = "gray", fill = "black"),
    legend.title = element_text(color = "white"),
    legend.text = element_text(color = "white"),
    # Text elements
    text = element_text(size = 30, colour = "white"),
    axis.text = element_text(size = 30, colour = "white"),
    axis.title = element_blank()
  )

dev.off()