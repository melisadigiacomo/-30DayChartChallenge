# Candlestick chart

###
# Library
library(quantmod) 

# Data from Bitcoin Stock data
bitcoin<-getSymbols("BTC-USD", 
                  from = "2022-01-01", 
                  to = "2022-04-18",
                  periodicity = "daily",
                  auto.assign=FALSE)

# Candlesitck chart
chartSeries(bitcoin, name="Bitcoin Candlestick Chart", theme="white")
