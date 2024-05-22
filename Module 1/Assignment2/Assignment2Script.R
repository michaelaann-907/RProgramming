# Name: Michaela Pierce
# Module 1: Assignment 2
# Date: 3/13/24


################################################################################


#==Question 1: Simple Vector Assignment

#1) Create an object called student_num and assign it the values 1 through 75. 
    student_num <- (1:75) # or student_num <- seq(1,75)

#2) Write the code to display the contents of student_num 
    print(student_num) # or student_num
################################################################################


#==Question 2: Loading Packages and Plotting Data
    
# 1) Write the code to load the tidyverse package. 
     library(tidyverse)

# 2) Create an object called sales. 
     #sales <-

# 3) Add the following values to sales (in this order): 50, 150, 200, 100, 300, 250 
     sales <- c(50, 150, 200, 100, 300, 250) 

# 4) Create another object called month. 
     #month <-

# 5) Add the following values to month (in this order): 1,2,3,4,5,6 
     month <- c(1, 2, 3, 4, 5, 6)

# 6) Use the qplot function to create a scatterplot with sales on the y-axis and month on the x-axis.
     qplot(month, sales, geom = "point", xlab = "Month", ylab= "Sales")

# 7) Add the following comment to your script and answer the question on the same line:
     #What month had the largest sales? What was the amount? Month 5 ; 300
################################################################################


#==Question 3: Working with Vectors and Data Types
     
# 1) Create a vector called months and add the months of the year (e.g., Jan, Feb, Mar, etc.).
     months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

     
# 2) Add the following comment to your script and answer the question on the same line: 
     typeof(months) #What type of vector is this (hint: use typeof() or look in environment pane)? character (chr)
     
     
# 3) Create a vector called days and add the days of the week (Mon.-Sat.) except for Sunday where you should enter the number 7. 
     days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", 7)

          
# 4) Add the following comments to your script and answer the question on the same line: 
     #How is the number 7 treated in the vector (as a double or character)? It is treated as a double.
     typeof(7)
     #Why? Because 7 was not stored as a string (using quotation marks), it was stored as a numeric value.
     #Numeric values are stored as doubles by default unless specified with an 'L' after each number.

     # I did research this to better understand. The sources I used are specified below.
     #https://afit-r.github.io/numbers/#:~:text=By%20default%2C%20when%20you%20create,L%20directly%20after%20each%20number.
     #https://uc-r.github.io/integer_double/

          
# 5) Write the following code: 
     Days <- c(1:7) 
     

# 6) Add the following comments to your script and answer the question on the same line: 
     #Do Days and days contain the same values?  No
     #If they are different, what data type is Days and days? Days is integer (int) data type. days is character (chr) data type.


################################################################################


#==Question 4: Data Frames 
# 7) Create a new data frame called Yearly_Sales. This data frame will contain two vectors with name for the 
     #first vector being month and the second vector being sales. For month, type out the abbreviation for the 
     #12 months of the year (e..g, Jan). For sales, add the following values: 150.25, 258.54, 268.55, 122.52, 
     #987, 458.82, 667.23, 845.54, 586.78, 888.58, 756.12, 456.84.
     month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
     sales <- c(150.25, 258.54, 268.55, 122.52, 987, 458.82, 667.23, 845.54, 586.78, 888.58, 756.12, 456.84)
     Yearly_sales <- data.frame(month, sales)
     
     
# 8) Add the following comments to your script and answer the question on the same line 
     #Open data frame from the environment pane. 
     #Which month had the most sales? May = 987
     #Which month had the least sales? Apr = 122.52

     
# 9) Finally, add the code to the script that would create a qplot with month on the y-axis and sales on the x
     #axis (hint: to select a column of data you use the $ sign as in yearly_sales$sales).
     library(ggplot2)
     qplot(data = Yearly_sales, y = Yearly_sales$month, x = Yearly_sales$sales,
           main = "Monthly Sales", xlab = "Sales", ylab = "Month")
     
