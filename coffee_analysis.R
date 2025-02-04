library(tidyverse)

#create a random data set
set.seed(123) # getting a same result in every running

drinks_coffee <- rnorm(30, mean = 5.5, sd = 1)

not_drinks_coffee <- rnorm(30, mean = 4.8, sd = 1)

my_data <- data.frame(
  group = rep(c("Drinks Coffee", "Dont Drinks Coffee"), each = 30),
  duration_study <- c(drinks_coffee, not_drinks_coffee)
)

head(my_data)

ggplot(my_data, aes(x = group, y = duration_study, fill = group)) + 
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Coffee Consumption and Study Duration", 
       x = "Group", y = "Duration of Study (hour)")

t_test_result <- t.test(duration_study ~ group, data = my_data, var.equal = TRUE)
print(t_test_result)
