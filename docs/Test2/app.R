#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)



library(shiny)

# USER INTERFACE
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      # put web page elements here
      # usually shiny widgets
      actionButton("action1", label = "press me"),
      actionButton("action2", label = "press me"),
      sliderInput("slider1", label = h3("Slider"), min = 0, 
                  max = 100, value = 50),
      selectInput("select", label = h3("Select box"), 
                  choices = list("Choice 1" = 1,
                                 "Choice 2" = 2, 
                                 "Choice 3" = 3), 
                  selected = 1)
      
    ),
    mainPanel(
      # put web page elements here
      # usually to display things
      plotOutput("plot1"),
      plotOutput("plot2"),
      textOutput("text1")
      
    )
  )
)

# SERVER
server <- function(input, output) {
  
  # recieve inputs
  # do things
  # update the webpage
  
  output$plot1 <- renderPlot({
    hist(rnorm(100,0,1))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

library(shiny)

# USER INTERFACE
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      # displays an action button
      actionButton("action1", label = "press me")
    ),
    mainPanel(
      # create a plotting object for the webpage
      plotOutput("someplot")
    )
  )
)

# SERVER
server <- function(input, output) {
  
  # make a new plot every time button is clicked  
  observeEvent(input$action1, {
    output$someplot <-  renderPlot({
      hist(rnorm(100,0,1))
    })
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)


