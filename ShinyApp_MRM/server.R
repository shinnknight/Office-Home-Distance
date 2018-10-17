
server <- function(input,output, session){
  
  data <- reactive({
    x <- df_1
  })
  
  output$dt <- DT::renderDataTable(
    DT::datatable(
      df_1, options = list(
        lengthMenu = list(c(5, 15, -1), c('5', '15', 'All')),
        pageLength = 8
      )
    )
  )
  
  output$mymap <- renderLeaflet({

    content <- paste("ID:", df_1$ID,"<br/>",
                     "Business Unit:",df_1$Business.Unit,"<br/>",
                     "Job Title:", df_1$Job.Title,"<br/>") 
    
    # leaflet(df_1) %>%
    #   addCircles(lng = ~Longitude, lat = ~Latitude, color = "pink", weight = 1, popup = content)
    
    Set1 <- c("pink", "yellow", "orange", "red","brown","blue")
    pal = colorFactor(Set1, domain = df_1$Business.Unit) 
    color_offsel1 = pal(df_1$Business.Unit)
    
      leaflet(df_1) %>% addTiles() %>%
      addProviderTiles("CartoDB.Positron") %>%
      addCircleMarkers(lng = ~Longitude, lat = ~Latitude, color = color_offsel1, radius=0.1, popup = content, stroke = TRUE, fillOpacity = 0.5) %>% 
      addCircleMarkers(clusterOptions = markerClusterOptions())

    
  })
}