# Module 6 Assignment 3
# Mastering Shiny - 4 Case Study - ER Injuries
# Pierce, Michaela 




# Libraries
# 4.1 - Introduction
library(shiny) 
library(vroom) 
library(tidyverse)




# Load Data
# 4.2 - The data
injuries <- vroom::vroom("injuries.tsv.gz") 
products <- vroom::vroom("products.tsv") 
population <- vroom::vroom("population.tsv") 






# Function to truncate tables
# 4.5 - Polish Tables
count_top <- function(df, var, n = 5) {
  df %>%
    mutate({{ var }} := fct_lump(fct_infreq({{ var }}), n = n)) %>%
    group_by({{ var }}) %>%
    summarise(n = as.integer(sum(weight)))
}





# User Interface (UI)
# 4.6 - Rate vs count 
ui <- fluidPage( 
  fluidRow( 
    column(8, 
           selectInput("code", "Product",
                       choices = setNames(products$prod_code, products$title),
                       width = "100%"
           )
    ),
    column(2, selectInput("y", "Y axis", c("rate", "count")))
  ), 
  fluidRow( 
    column(4, tableOutput("diag")), 
    column(4, tableOutput("body_part")), 
    column(4, tableOutput("location")) 
  ), 
  fluidRow( 
    column(12, plotOutput("age_sex")) 
  ),
  # Add new row to bottom of UI, with action button to trigger 
  # new story, and put narrative in textOutput()
  # Part of 4.7 - Narrative
  fluidRow(
    column(2, actionButton("story", "Tell me a story")),
    column(10, textOutput("narrative"))
  )
)







# Server
# Part of 4.4 - Prototype
server <- function(input, output, session) { 
  selected <- reactive(injuries %>% filter(prod_code == input$code)) 
  
  # Render truncated tables
  output$diag <- renderTable(count_top(selected(), diag), width = "100%")
  output$body_part <- renderTable(count_top(selected(), body_part), width = "100%")
  output$location <- renderTable(count_top(selected(), location), width = "100%")
  
  # Render plot based on y-axis selection
  summary <- reactive({ 
    selected() %>% 
      count(age, sex, wt = weight) %>% 
      left_join(population, by = c("age", "sex")) %>% 
      mutate(rate = n / population * 1e4) 
  }) 
  output$age_sex <- renderPlot({ 
    if (input$y == "count") {
      summary() %>%
        ggplot(aes(age, n, colour = sex)) + 
        geom_line() + 
        labs(y = "Estimated number of injuries")
    } else {
      summary() %>%
        ggplot(aes(age, rate, colour = sex)) + 
        geom_line(na.rm = TRUE) + 
        labs(y = "Injuries per 10,000 people")
    }
  }, res = 96) 
  
  

  
# Render random narrative
# 4.7 - Narrative
  narrative_sample <- eventReactive(
    list(input$story, selected()),
    selected() %>% pull(narrative) %>% sample(1)
  )
  output$narrative <- renderText(narrative_sample())
}

  
  


# Run the application
shinyApp(ui = ui, server = server)




