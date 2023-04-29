beautyData <- read.csv("All_Beauty.csv")
summary(beautyData)


#Review text
# Create a new column with the text length of an existing column
beautyData$length_column <- nchar(as.character(beautyData$reviewText))

# Write the updated data frame to a new CSV file
write.csv(beautyData, "beautyData_with_length.csv", row.names = FALSE)

beautyDataWithLength <- read.csv("beautyData_with_length.csv")

summary(beautyDataWithLength)

fit <- lm(beautyDataWithLength$overall ~ beautyDataWithLength$length_column)
summary(fit)

plot(beautyDataWithLength$overall,beautyDataWithLength$length_column,
     xlab="Overall rating",
     ylab="Length of review")
abline(fit)

#verified or not

verifed_column <- beautyData$verified
verifed_column
verified_numeric <- as.numeric(verifed_column)
beautyData$verified <- verified_numeric

write.csv(beautyData, "numeric_verifed.csv")

numericVerified <- read.csv("numeric_verifed.csv")
numericVerified <- na.omit(numericVerified)

fit <- lm(numericVerified$overall ~ numericVerified$verified)
summary(fit)


