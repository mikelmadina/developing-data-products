library(shiny)

shinyServer(
        function(input, output) {
                output$plot <- renderPlot({
                        
                        mean = input$mean ; sd = input$sd
                        
                        x <- seq(-4, 4, length=1000) * sd + mean
                        hx <- dnorm(x, mean, sd)
                        if (input$comp == 1) {
                                lb = min(x) ; ub = input$x ; comparador = "<"
                        } else {
                                lb = input$x; ub = max(x) ; comparador = ">"
                        }
                        plot(x, hx, type="l", xlab="", ylab="", main="Probablity under normal distribution", axes=F)
                        i <- x >= lb & x <= ub
                        lines(x, hx)
                        polygon(c(lb,x[i],ub), c(0,hx[i],0), col="grey")
                        area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
                        result <- paste("P-value =", signif(area, digits=3))
                        mtext(result,3)
                        axis(1, pos=0) 
                })
        }
)