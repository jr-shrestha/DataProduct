shinyUI(pageWithSidebar(
  headerPanel("BoxPlot Demo: Monthly Salary Vs Income"),
  sidebarPanel(
    h3('Input for randomization'),
    sliderInput('totalNum', 'Total Number of Samples', value = 500, min = 100, max = 1000, step = 50),
    sliderInput('meanVal',  'Mean Salary', value = 50000, min = 10000, max = 90000, step = 1000),
    sliderInput('sdevVal',  'Standard Deviation', value = 10000, min = 0,     max = 20000, step = 1000),
    h3('Introduce Bias'),
    p('+ve value --> increase salary in male'),
    p('-ve value --> increase salary in female'),
    sliderInput('biasVal',    'Bias (in %)', value = 0, min = -50, max = 50, step = 5)
  ),
  mainPanel(
    plotOutput('newBoxPlot')
  )
))