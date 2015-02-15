library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Developing data products"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        p("This application calculates the p-value under a normal distribution."),
                        p("In order to perform the calculation, you must provide this data: mean, standard deviation, and sample mean. You can both use the arrows to increase or decrease the value, or input directly your value."),
                        p("You can also select if the application must calculate the probabilities of the mean being lower or greater than the sample mean you provide."),
                        numericInput("mean", 
                                     label = h3("Mean"), 
                                     value = 0),
                        numericInput("sd", 
                                     label = h3("SD"), 
                                     value = 1),  
                        numericInput("x",
                                    label = h3("Sample mean"),
                                    value = 2),
                
                        radioButtons("comp", 
                                     label = h3("Comparison"),
                                     choices = list("P(mean < sample mean)" = 1, "P(mean > sample mean)" = 2),
                                     selected = 1)),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("plot")
                )
        )
))