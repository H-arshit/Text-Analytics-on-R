setwd("~/Desktop/ML GIT/Text Analytics/1/")

dataset <- read.csv("spam.csv" , stringsAsFactors = FALSE)


dataset <- dataset[ , 1:2]

colnames(dataset) <- c("Label" , "Text")


# ckeck for missing val
length(which(!complete.cases(dataset)))


dataset$Label <- as.factor(dataset$Label)


table(dataset$Label)
prop.table(table(dataset$Label))


dataset$Text <- iconv(dataset$Text, "ISO-8859-1", "UTF-8") 
dataset$Length <- nchar(dataset$Text)

library(ggplot2)


ggplot(dataset , aes(x = Length  , fill = Label)) + 
  theme_bw() + 
  geom_histogram(binwidth = 7) + 
  labs( y = "Text Count" , x = "Length Of Text" , title = "Distribution Of Text Length with Label")
