## Setup
# -----------------------------------

usePackage <- function(p) {
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  library(p, character.only = TRUE)
}

usePackage("shiny")
usePackage("RCurl")
# if (!require("devtools"))
#   install.packages("devtools")
# devtools::install_github("rstudio/shinyapps")

library(shinyapps)
# devtools::install_github('rstudio/packrat')
# devtools::install_github('rstudio/rsconnect')

library(rsconnect)

# shinyapps::setAccountInfo(name='kie-g',
#                          token='5076940723A3F210CF0DACA494E0CFFE',
#                          secret='Buoi6Vl55WSZ8AVPC9DYOZgKM+hl/UNUFqN2yx8B')

usePackage <- function(p) {
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  library(p, character.only = TRUE)
}

usePackage("openxlsx") # To import excel files




file <- "./data/2015_YouthfulCities_Index_Ranking_Sheet_Values.xlsx"

wb <- loadWorkbook(file)

f.scores <- read.csv("Final.Ranking.Values.csv", header = TRUE, sep = " ")


raw <- readWorkbook(wb, 
                    sheet = 2,
                    colNames = TRUE,
                    rowNames = FALSE)

cat.lookup <- raw[ ,1:2]
countries <- row.names(f.scores)
categories <- unique(cat.lookup$Category)

safety             <- f.scores[ , cat.lookup[cat.lookup$Category == "Safety", 1]]
affordability      <- f.scores[ , cat.lookup[cat.lookup$Category == "Affordability", 1]]
transit            <- f.scores[ , cat.lookup[cat.lookup$Category == "Transit", 1]]
health             <- f.scores[ , cat.lookup[cat.lookup$Category == "Health", 1]]
travel             <- f.scores[ , cat.lookup[cat.lookup$Category == "Travel", 1]]
employment         <- f.scores[ , cat.lookup[cat.lookup$Category == "Employment", 1]]
environment        <- f.scores[ , cat.lookup[cat.lookup$Category == "Environment", 1]]
education          <- f.scores[ , cat.lookup[cat.lookup$Category == "Education", 1]]
entrepreneurship   <- f.scores[ , cat.lookup[cat.lookup$Category == "Entrepreneurship", 1]]
public.space       <- f.scores[ , cat.lookup[cat.lookup$Category == "Public space", 1]]
financial.services <- f.scores[ , cat.lookup[cat.lookup$Category == "Financial services", 1]]
diversity          <- f.scores[ , cat.lookup[cat.lookup$Category == "Diversity", 1]]
digital.access     <- f.scores[ , cat.lookup[cat.lookup$Category == "Digital Access", 1]]
music              <- f.scores[ , cat.lookup[cat.lookup$Category == "Music", 1]]
creative.arts      <- f.scores[ , cat.lookup[cat.lookup$Category == "Creative arts", 1]]
sports             <- f.scores[ , cat.lookup[cat.lookup$Category == "Sports", 1]]
film               <- f.scores[ , cat.lookup[cat.lookup$Category == "Film", 1]]
civic.engagement   <- f.scores[ , cat.lookup[cat.lookup$Category == "Civic engagement", 1]]
food.and.nightlife <- f.scores[ , cat.lookup[cat.lookup$Category == "Food and nightlife", 1]]
fashion            <- f.scores[ , cat.lookup[cat.lookup$Category == "Fashion", 1]]






# App Build
# ---------------------------

library(shiny)
library(ggplot2)

dataset <- diamonds

ui <- fluidPage(
  
  fluidRow(
    column(12, title = h1("Youthful Cities Index Ranking"))
    ),
  
  fluidRow(
    column(12, 
           selectInput("country.choice1", label = h5("Select Country"), 
                           choices = list(countries = countries), 
                           selected = "Toronto"),
           
           selectInput("country.choice2", label = h5(" "), 
                           choices = list(countries = countries), 
                           selected = "New.York.City"),

           
           fluidRow(
             
             column(3, 
                    selectInput('affordability', 
                                label = h5('Affordability'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                                ),
                    selectInput('civic.engagement', label = h5('Civic Engagement'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                                ),
                    selectInput('creative.arts', label = h5('Creative Arts'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                                ),
                    selectInput('digital.access', label = h5('Digital Access'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                                ),
                    selectInput('diversity', label = h5('Diversity'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5)
                    ),
             
             column(3, 
                    selectInput('education', 
                                label = h5('Education'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('employment', label = h5('Employment'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('entrepreneurship', label = h5('Entrepreneurship'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('environment', label = h5('Environment'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('fashion', label = h5('Fashion'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5)
             ),
             
             column(3, 
                    selectInput('film', 
                                label = h5('Film'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('financial.services', label = h5('Financial Services'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('food.nightlife', label = h5('Food and Nightlife'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('health', label = h5('Health'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('music', label = h5('Music'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5)
             ),
             
             column(3, 
                    selectInput('public.space', 
                                label = h5('Public Space'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('safety', label = h5('Safety'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('sports', label = h5('Sports'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('transit', label = h5('Transit'), 
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5
                    ),
                    selectInput('travel', label = h5('Travel'),
                                choices = list("0 - Do not include" = 0,
                                               "1 - Unimportant" = 1,
                                               2,3,4,
                                               "5 - Default" = 5, 
                                               6,7,8,9,
                                               "10 - Very Important"),
                                selected = 5)
             )
           )
    )
  )
)


server <- function(input, output) {
  
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

