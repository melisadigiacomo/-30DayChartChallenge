# Cicle packing: mushrooms

# Libraries
# devtools::install_github("jeromefroe/circlepackeR")
library(circlepackeR)         
library(data.tree)
library(htmlwidgets)

# Data
mushrooms = read.csv("mushrooms.csv", header=T)
mushrooms$pathString <- paste("world", mushrooms$group, mushrooms$subgroup, mushrooms$subsubgroup, sep = "/")
mushrooms_nodes <- as.Node(mushrooms)

# Plot
circlepackeR(mushrooms_nodes, size = "value")

p <- circlepackeR(mushrooms_nodes, size = "value", color_min = "hsl(56,80%,80%)", 
                  color_max = "hsl(341,30%,40%)") 
p

# save the widget
saveWidget(p, file=paste0( getwd(), "/circular_packing_mushrooms.html"))