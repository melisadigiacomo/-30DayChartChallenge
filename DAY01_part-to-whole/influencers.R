# Parliament plot

# Libraries
library(ggparliament)
library(ggplot2)

# Data
re = read.csv("influencers_category.csv", header = TRUE, sep = ";")

# Create the data frame
re_circle <- parliament_data(election_data = re,
                             type = "circle",
                             parl_rows = 10,
                             party_seats = re$n)

# Plot type = circle
png("influencers.png", units="in", width=12, height=12, res=300, bg="transparent")

ggplot(re_circle, aes(x = x, y = y, colour = category)) +
  geom_parliament_seats() + 
  geom_parliament_bar(colour = colour_IG, party = category, label = TRUE) +
  scale_colour_manual(values = re_circle$colour_IG, 
                      limits = re_circle$category) +
  theme_ggparliament() +
  theme(text = element_text(size = 30)) +
  labs(title = "Category of top 1000 IG influencers",
       caption = "@melisadigiacomo\nDAY01 #30DayChartChallenge April 2022")


dev.off()

# Plot type = semicircle
re_semicircle <- parliament_data(election_data = re,
                                 type = "semicircle",
                                 parl_rows = 10,
                                 party_seats = re$n)

ggplot(re_semicircle, aes(x = x, y = y, colour = category)) +
  geom_parliament_seats() + 
  draw_partylabels(type = "semicircle",
                   party_names = category,
                   party_seats = percent_from_total,
                   party_colours = colour_IG) +   
  theme_ggparliament() +
  labs(title = "Main five categories of top 1000 IG influencers",
       caption = "@melisadigiacomo\nDAY01 #30DayChartChallenge April 2022") +
  scale_colour_manual(values = re_semicircle$colour_IG, 
                      limits = re_semicircle$category) 