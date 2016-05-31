library(UsingR)
shinyServer(
  function(input, output) {
    output$newBoxPlot <- renderPlot({
      #Extract the variables from UI into local variables 
      totalNum <- input$totalNum
      meanVal  <- input$meanVal
      sdevVal  <- input$sdevVal
      biasVal  <- input$biasVal
      
      #Construct a dataframe of gender and salary with random values
      gender <- as.factor(sample(c('male', 'female'), totalNum, replace=TRUE))
      salary <- rnorm(totalNum, mean=meanVal, sd=sdevVal)
      dFrame <- data.frame(gender,salary) 
      
      #Introduce some bias in the salary as per the gender
      dFrame[which(gender=='female'),]$salary <- dFrame[which(gender=='female'),]$salary * (1-biasVal/100)
      dFrame[which(gender=='male'),]$salary <- dFrame[which(gender=='male'),]$salary * (1+biasVal/100)
      
      #plot the data
      boxplot(salary~gender, data = dFrame, xlab='Gender', ylab='salary')
    })
  }
)