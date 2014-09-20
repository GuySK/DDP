library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Weight Controller"),
    
    # Sidebar 
    sidebarPanel(
        mainPanel("Body Mass Index Calculator"),
        br(),
        br(),
        selectInput("wunit", label=h6("Choose Unit"), 
                    choices = list("Kg" = 1, "Pounds" = 2), 
                    selected = 1),
        numericInput("Weight", label=h5("Weight"), 0, min=25, max=140, step=1),
        br(),
        br(),
        selectInput("hunit", label=h6("Choose Unit"), 
                    choices = list("cm" = 1, "inches" = 2), 
                    selected = 1),        
        numericInput("Height", label=h5("Height"), 0, min=120, max=210, step=1),
        br(),
        br(),
    #    radioButtons("sex", label = h5("Sex"),
    #    choices = list("Female" = 1, "Male" = 2), 
    #                 selected = 0),
        actionButton("Calc", label="Calculate BMI")
                ),

    # Main Panel        
    mainPanel(
        
        p("The body mass index (BMI) is a measure of relative weight based on an individual\'s 
          mass and height. It is defined as the individual\'s body mass divided by the square 
          of their height - with the value universally being given in units of kg/m2."),
        
        h4("Your BMI is:"),
        verbatimTextOutput("bmi"),
        
        h4("Your BMI Prime is:"),
        verbatimTextOutput("bmiprime"),
        
        plotOutput("bmiPlot")
        
    )
  )
)