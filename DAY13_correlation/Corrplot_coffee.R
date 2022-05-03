# Correlations

# Libraries
library(corrplot)
library(ggcorrplot)
library(RColorBrewer)

# Dataset
starbucks <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-12-21/starbucks.csv')

# Select numerical variables
starbucks <- subset(starbucks, select = c(6:15))

# Transform non-numerical variables
starbucks <- transform(starbucks, trans_fat_g = as.numeric(trans_fat_g), 
          fiber_g = as.numeric(fiber_g))

# color palettes
palette <- c("#513a2f", "#785c4f", "#8f776d", "#a89992", "#5be6a7", "#0bb567", "#2f6144", "#224634")

# Corrplot
corrplot(cor(starbucks), order = "hclust", type='upper', addCoef.col = "white", tl.col="black", method="color",
         p.mat = cor_pmat(starbucks), sig.level = 0.05, diag=TRUE, col= palette, tl.cex = 1) 

#Corrplot PNG
png("corrplot.png", units="in", width=30, height=20, res=300, bg="transparent")

corrplot(cor(starbucks), order = "hclust", type='upper', addCoef.col = "white", tl.col="black",method="color",
         p.mat = cor_pmat(starbucks), sig.level = 0.05, diag=TRUE, col= palette, tl.cex = 3, 
         number.cex = 3, cl.cex = 3) #last parameters to chang size labels

dev.off()