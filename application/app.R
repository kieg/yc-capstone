## Setup
# -----------------------------------

usePackage <- function(p) {
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  library(p, character.only = TRUE)
}

usePackage("shiny")

# if (!require("devtools"))
#   install.packages("devtools")
# devtools::install_github("rstudio/shinyapps")

library(shinyapps)
# devtools::install_github('rstudio/packrat')
# devtools::install_github('rstudio/rsconnect')

library(rsconnect)

#shinyapps::setAccountInfo(name='kie-g',
#                          token='5076940723A3F210CF0DACA494E0CFFE',
#                          secret='Buoi6Vl55WSZ8AVPC9DYOZgKM+hl/UNUFqN2yx8B')


# App Build
# ---------------------------

ui <- fluidPage(
  sliderInput(inputId = "num2",
            label = "Choose a number",
            value = 25, min = 1, max = 100),

  plotOutput(outputId = "some_name_hist"),
  
  verbatimTextOutput("stats")

)
                

server <- function(input, output) {
data <- reactive({
  rnorm(input$num2)
                 })  
    
output$some_name_hist <- renderPlot({
  title <- "100 random normal values"
  hist(data(), main = title)
                                    })

output$stats <- renderPrint({
  summary(data())
                            })

}

shinyApp(ui = ui, server = server)





# Share your app

# One directory with every file the app needs:
#   - app.R (your script which ends with a call to shinyApp())
#   - datasets, images, css, helper scripts, etc...

# Shinyapps.io
# intall package shiny apps
# devtools::install_github("rstudio/shinyapps")
# go to tokens in your shinyapps account - use that to sign in on rstudio when you run this package.