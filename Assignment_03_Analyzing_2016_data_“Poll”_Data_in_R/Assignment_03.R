# Assignment #3: Analyzing 2016 data “Poll” Data in R

# 1. create vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

# Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect 
str(df_polls)
head(df_polls)


# 2. Compute Summary Statistics

# mean
mean(df_polls$ABC_poll)
mean(df_polls$CBS_poll)

# median
median(df_polls$ABC_poll)
median(df_polls$CBS_poll)

# range
range(df_polls[, c("ABC_poll", "CBS_poll")])

#Add a column for the difference between CBS and ABC:
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll
df_polls

#Create barplot 
library(ggplot2)
ggplot(df_polls, aes(x = Name)) +
  geom_bar(aes(y = ABC_poll, fill = "ABC Poll"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = CBS_poll, fill = "CBS Poll"), stat = "identity", position = "dodge") +
  labs(title = "ABC vs CBS Poll Comparison",
       x = "Candidate",
       y = "Poll Percentage",
       fill = "Poll Source") +
  theme_minimal()


