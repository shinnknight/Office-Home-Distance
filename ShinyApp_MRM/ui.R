library(shiny)
library(leaflet)
library(dplyr)

df_1 <- readRDS("./data.rds")


navbarPage('Super Demo', id = 'nav',
  tabPanel('interactive map', 
           div(class = 'outer',
               tags$head(
                 #include css and js
                 includeCSS("styles.css"),
                 includeScript("gomap.js")
               ),
              
            leafletOutput("mymap",height = 1000),
           
           absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                         draggable = TRUE, top = 30, left = "auto", right = 20, bottom = "auto",
                         width = 150, height = "auto",

                         h3("Plot display"),

                         # selectInput("color", "Color", vars),
                         # selectInput("size", "Size", vars, selected = "adultpop"),
                         # conditionalPanel("input.color == 'superzip' || input.size == 'superzip'",
                         #                  # Only prompt for threshold when coloring or sizing by superzip
                         #                  numericInput("threshold", "SuperZIP threshold (top n percentile)", 5)
                         # ),

                         plotOutput("histCentile", height = 100),
                         plotOutput("scatterCollegeIncome", height = 50)
                )

           )
  ),
           
           tabPanel('Data table', DT::dataTableOutput('dt'))
  )



