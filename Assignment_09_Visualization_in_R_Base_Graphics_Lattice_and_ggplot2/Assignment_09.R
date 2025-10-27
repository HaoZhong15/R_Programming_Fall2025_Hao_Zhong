install.packages("AER")
install.packages("lattice")

library(AER)
library(lattice)
library(ggplot2)

data("CartelStability", package = "AER")
head(CartelStability)
str(CartelStability)

# 1.Base R Graphics
# Scatter plot
plot(CartelStability$price, CartelStability$quantity,
     main = "Base: Quantity vs Price by Cartel",
     xlab = "Price",
     ylab = "Quantity",
     col = ifelse(CartelStability$cartel == "yes", "red", "blue"),
     pch = 19)

# Histogram
hist(CartelStability$price,
     main = "Base: Distribution of Price",
     xlab = "Price",
     col = "green")



# 2.Lattice Graphics
# Conditional scatter plot (small multiples)
xyplot(quantity ~ price | cartel,
       data = CartelStability,
       main = "Lattice: Quantity vs Price by Cartel",
       xlab = "Price",
       ylab = "Quantity",
       pch = 19,
       col = "orange")



# Box-and-whisker plot
bwplot(price ~ season,
       data = CartelStability,
       main = "Lattice: Price by Season",
       xlab = "Season",
       ylab = "Price",
       col = "cyan",
       scales = list(x = list(rot = 45))) #AI assist. Easy to read the -axis labels when they are long or overlapping.



# 3.ggplot2

# Scatter plot with smoothing
ggplot(CartelStability, aes(x = price, y = quantity, color = cartel)) +
  geom_point(size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE) + labs(title = "Quantity vs Price by Cartel",
       x = "Price",
       y = "Quantity",
       color = "Cartel") + theme_minimal()





# Faceted histogram
ggplot(CartelStability, aes(x = price)) +
  geom_histogram(binwidth = 0.05, fill = "purple", color = "grey") +
  facet_wrap(~ cartel) + labs(title = "Price Distribution by Cartel",
       x = "Price",
       y = "Count") + theme_minimal()
