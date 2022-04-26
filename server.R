library(shiny)
library(tidyverse)
library(gplots)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        noe <- 0
        p <- as.numeric(input$scale)
        if (input$scale == 7) {noe <- 1}
        if (input$scale == 6) {noe <- 2}
        if (input$scale == 5) {noe <- 3}
        if (input$scale == 4) {noe <- 4}
        if (input$scale == 3) {noe <- 5}
        if (input$scale == 2) {noe <- 6}
        if (input$scale == 1) {noe <- 7}
        nbr <- as.numeric(input$level)
        nbr <- nbr/100
        nbr <- nbr + ((p*0.1428571)-0.1428571)
        Escala <- c(1, 0.8571429, 0.7142857, 0.5714286, 0.4285714, 0.2857143, 0.1428571)
        LoE <- c(0,0,0,0,0,0,0)
        dt <- cbind(Escala, LoE)
        dt[noe,2] <- nbr
        heatmap.2(dt, Rowv = NULL, Colv = NULL, 
                  cexCol = 1.5, colCol =  "black",
                  keysize = 1.5, key.title = "Escala", 
                  key.xlab = "Nivel", key.ylab = " ",
                  vline = NULL, tracecol = "black", 
                  col = RColorBrewer::brewer.pal(7, "Blues"),
                  cellnote = round(dt, 2),
                  notecol = "black", 
                  margins = c(5,5), 
                  notecex = 1.5, cexRow = 0.1)

    })

})
