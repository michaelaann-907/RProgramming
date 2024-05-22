# Name: Michaela Pierce
# Module 2: Assignment 1



################################################################################
#Question 1: Importing an external dataset
#1) Saved Marketing.csv 

#2) Import the Marketing.csv file into RStudio using readr which was discussed in the video. Answer the following questions in your script.
library(readr)
Marketing <- read_csv("Marketing.csv")

#How many variables does this dataset contain? 7 variables
#What are the number of observations? 548 observations

#3) Look at the console. Even though you were able to upload the file in RStudio without writing the actual
#code, R still needs to execute the code in the console. Answer the following question in your script.

#What was the first line of code that had to be run to import the file? library(readr) 

#Why did this line have to be run first before importing the file? This line had to be run first to load the readr library, 
#which provides functions for reading data files into R. The read_csv would not be recognized unless the readr library was loaded.


################################################################################
    
    
# Question 2: Finding and Manipulating Data 
# 1) In this module, you were introduced to retrieving data from an atomic vector. The same concepts work 
#for retrieving data from a data frame. Instead of having just a single number to designated the column 
#(from the lecture, example[4] returned the fourth entry (or column) in our vector), you will need to also 
#designate the row: Example[x,y] – where x is the row and y is the column


# 2) Within your script, write the code to display the value within the data frame for row 20 in the 
#SalesinThousands column. Run this code in your script.
value <- Marketing[20, "SalesInThousands"]
print(paste("Value in row 20 of SalesinThousands column:", value))

# I wanted to print both a string or character(in R) and a variable on the same line. 
# I used the sources below to better understand how to do this. 
#https://www.geeksforgeeks.org/how-to-print-string-and-variable-on-same-line-in-r/
#https://www.statology.org/r-print-string-and-variable/


# 3) Answer the question below in your script: 
#What were the total sales in this row? 23.35


# 4) Now, using a similar syntax, write the code in your script to change the value of the sales in row 20 to 123.45 
value2 <- Marketing[20, "SalesInThousands"] <- 123.45





# 5) Write the code within your script to doing the following comparisons: 
#a) Check to see if SalesinThousands for Location 1 - Week 4 (row 4) > SalesinThousands for Location 9 - Week 4 (row36). Run the code and in the script answer the following question: 

# Sales in thousands for Location 1 - Week 4 (row 4)
sales_location1 <- Marketing[4, "SalesInThousands"]

# Sales in thousands for Location 9 - Week 4 (row 36)
sales_location9 <- Marketing[36, "SalesInThousands"]

# Comparison
comparison <- sales_location1 > sales_location9

# Print values
print(paste("Sales in thousands for Location 1 - Week 4:", sales_location1))
print(paste("Sales in thousands for Location 9 - Week 4:", sales_location9))


if (comparison) {
  print("Yes, the sales at location 1 were greater than location 9 for week 4.")
} else {
  print("No, the sales at location 1 were not greater than location 9 for week 4.")
}
# I wanted to do an if statement and used the source below to better
# understand logical operators and how to do this.
# https://rpubs.com/pjmurphy/317508



#Were the sales at location 1 greater than location 9 for week 4? No
     
     
#b) Check to see if the AgeOfStores in row 389 and row 453 equal to each other. Run the code and in the script answer the following question: 

names(Marketing)

# Age of stores in row 389
age_store389 <- Marketing[389, "AgeOfStore"]

# Age of stores in row 453
age_store453 <- Marketing[453, "AgeOfStore"]

# Print values
print(paste("Age of store in row 389:", age_store389))
print(paste("Age of store in row 453:", age_store453))

# comparison
comparison2 <- age_store389 == age_store453 
if (comparison2) {
  print("Yes, the ages of the stores in rows 389 and 453 are equal.")
} else {
  print("No, the ages of the stores in rows 389 and 453 are not equal.")
}
# I wanted to do an if statement and used the source below to better
# understand logical operators and how to do this.
# https://rpubs.com/pjmurphy/317508



#Are the ages of the stores in rows 389 and 453 equal? No
#What would happen if we only use 1 equal sign in the comparison? 
#If we were to use 1 single equal sign (=) in the comparison, it would result in assignment instead of comparison.
#We should use double equal signs (==) for comparison.



# 6) You can also search through your data frame to find specific values using the syntax below: 
#Data_frame_name[ which(Data_frame_name$ColumnName==’character_value’), ] 
#Marketing[ which(Marketing$MarketSize=='Medium'),] 
#In the above example, this would return all the rows in the Marketing data frame that contain a value of 
#Medium in the MarketSize column. Notice that we are using a character to search (i.e., Medium) but 
#numbers can also be used (e.g.,  Marketing$MarketID==1).
Marketing[which(Marketing$MarketSize == 'Medium'), ]


    
# 7) Write the code in your script to search in the Marketing data frame and display all stores that have an 
#age of 22 (Note: this csv file has 4 weeks of data for each store).
Marketing[which(Marketing$AgeOfStore == 22), ]


# 8) Run the code and answer the following question in script:  
#How many stores in the data are 22 years old? 12


# 9) Upload the Mod2Assign1Script.R file into Canvas.