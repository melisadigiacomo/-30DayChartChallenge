# Climate change

# Library
library(dplyr)
library(ggplot2)

# Dataset
cases = read.csv("cases.csv", header=T)

# date format
cases$date <- as.Date(cases$date, format = "%m/%d/%y")
str(cases)

# Stacked + percent
png("cases.png", units="in", width=30, height=15, res=300, bg="transparent")

ggplot(cases, aes(fill=location, y=new_cases_per_million, x=date)) + 
  geom_bar(position="fill", stat="identity") +
  scale_fill_manual(values=c("#26547D", "#EF436B", "#FFCE5C", "#05C793", "#1391bd")) + 
  xlab("") +
  ylab("") +
  labs(title="NEW COVID-19 CASES PER MILLION",
       caption="Source: OWID\n@melisadigiacomo\nDAY24 #30DayChartChallenge April 2022") +
  scale_x_date(date_labels = "%m/%Y", date_breaks = '1 month', expand = c(0,0)) +
  scale_y_continuous(breaks = c(0.25, 0.5, 0.75, 1), expand = c(0,0)) +
  theme_classic() +
  theme(legend.position = "bottom",
        text = element_text(size = 50),
        axis.title = element_text(size = 40),
        axis.text = element_text(size = 40),
        plot.margin = unit(c(1,1,1,1), "cm"), 
        legend.background=element_blank(),
        panel.background = element_rect(fill = "transparent"),
        plot.background = element_rect(fill = "transparent", colour = NA))

dev.off()