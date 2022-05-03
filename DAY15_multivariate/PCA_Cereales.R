# Multivariate: PCA Cereales

# Library
library(FactoMineR)
library(factoextra)

# Own dataset
cereales_data = read.csv("cereales.csv", header=T)

rownames(cereales_data) <- cereales_data$name # Rownames
cereales <- subset(cereales_data, select = c(4:12)) # Numerical variables

# Selected coffees
fav_cereals = c("Cheerios", "Froot_Loops", "Frosted_Flakes", "Trix", "Cap'n'Crunch", "Corn_Flakes", "Raisin_Bran")

#PCA
cereales.pca <- PCA(cereales, graph = FALSE)

fviz_eig(cereales.pca, addlabels = TRUE, ylim = c(0, 40)) # Scree plot

fviz_pca_biplot(cereales.pca, #PCA biplot
                # Individuals
                geom=c("point", "text"), 
                col.ind = "black",
                pointshape = 1, pointsize = 3, labelsize = 5,
                #select.ind = list(contrib = 20), # The top 20 contributing individuals
                select.ind = list(name = fav_cereals), # Select individuals ## CHANGE BASED ON COFFEE
                # Variables
                arrowsize = 0.75, alpha.var = 1, col.var = "black", repel = T,
                title = "", xlab="PC1 (29.4%)", ylab="PC2 (23%)") +
  theme(text = element_text(size = 15),
        axis.title = element_text(size = 15),
        axis.text = element_text(size = 15))


# PCA PNG
png("cereals_PCA.png", units="in", width=30, height=15, res=300, bg="transparent")

fviz_pca_biplot(cereales.pca, #PCA biplot
                # Individuals
                geom=c("point", "text"), 
                col.ind = "red",
                pointsize = 10, labelsize = 15,
                select.ind = list(name = fav_cereals), # Select individuals
                # Variables
                arrowsize = 0.75, alpha.var = 1, col.var = "black", repel = T,
                title = "CEREALS: principal component analysis", xlab="PC1 (29.4%)", ylab="PC2 (23%)") +
  labs(caption="@melisadigiacomo\nDAY15 #30DayChartChallenge April 2022") +
  theme(text = element_text(size = 40),
        axis.title = element_text(size = 30),
        axis.text = element_text(size = 30))

dev.off()