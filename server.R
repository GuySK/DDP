library(shiny)
library(ggplot2)

unit.conv <- function(weight, height, units) {
    # coverts weight, height according to units vector
    if (units[1] == 2){
        weight <- weight * 0.453592
    }
    if (units[2] == 2) {
        height <- height * 2.54
    }   
    c(weight, height)
}

bmiCalc <- function(weight, height, units) {
    # computes BMI in kg/m2
    wh <- unit.conv(weight, height, units)
    return((wh[1] / wh[2]^2) * 10000)
}

coord.bmi <- function(weight, height) {
    xmin <- 40                     # min weight in kgm
    xmax <- 160                    # max weight in Kgm
    x <- c(xmin:xmax)              # x axis
    ymin <- sqrt(x/18.5) * 100     # normal lower limit for bmi in cm
    ymax <- sqrt(x/25) * 100       # normal upper limit for bmi in cm
    data.frame(weight=x, bmiInf=ymin, bmiSup=ymax) # return dframe for plotting
}

shinyServer(
    function(input, output) {
            
        output$bmi <- renderText({
            if (input$Calc == 0) {
                NULL
            } else {
                input$Calc
                isolate(round(bmiCalc(input$Weight, input$Height, 
                                c(input$wunit, input$hunit)),2))
            }
        })
        
        output$bmiprime <- renderText({
            if (input$Calc == 0) {
                NULL
            } else {
                input$Calc
                isolate(round(bmiCalc(input$Weight, input$Height, 
                                      c(input$wunit, input$hunit))/25, 2))
            }
        })
        
        output$bmiPlot <- renderPlot({
            if (input$Calc == 0) {
                NULL
            } else {
                
                input$Calc
                isolate({
                    wh <- unit.conv(input$Weight, input$Height, 
                                    c(input$wunit, input$hunit))
                    crds <- coord.bmi(wh[1], wh[2])
                    # plot
                    p <- ggplot(data=crds, aes(weight)) 
                    p <- p + geom_line(aes(y=bmiInf), colour="green", 
                                       linetype="dotted", size=1)  
                    p <- p + geom_line(aes(y=bmiSup), colour="red", 
                                       linetype="dotted", size=1)  
                    p <- p + geom_point(x=wh[1], y=wh[2], 
                                        colour="red", size=4, shape=21, 
                                        fill="white")
                    p <- p + ylim(130, 220) + xlim(40, 150)
                    p <- p + xlab("Weight [kg]") + 
                        ylab("Height [cm]") + 
                        ggtitle("BMI Position")
                    p
                })
            }
        })
    }        
)