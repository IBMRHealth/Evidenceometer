library(shiny)
library(tidyverse)
library(gplots)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(h1("Evidenciometro")),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(h3("Informe abaixo:"),
            sliderInput(inputId = "scale",
                        label = h5("Escala de evidencia (1-7):"), 
                        min = 1, max = 7, value = 1, step = 1),
            sliderInput(inputId = "level",
                        label = h5("Nivel de evidencia (0-14):"), 
                        min = 0, max = 14, value = 0, step = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(h3("Nivel de evidencia"),
            plotOutput("distPlot")
        )
    )
))
