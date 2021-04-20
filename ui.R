#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyr)
library(dplyr)
library(plotly)
library(shinydashboard)
library(DT)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Please provide your weight in Kg and your height in cm"),
            # Input: weight
            sliderInput("weight", "Weight in Kg:",
                        min = 0, max = 200,
                        value = 50),
            
            # Input: height
            sliderInput("height", "Height in cm:",
                        min = 0, max = 200,
                        value = 150),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            htmlOutput("pText"),
            valueBoxOutput("BMI"),
            valueBoxOutput("IdealWeight"),
            valueBoxOutput("Weightloss"),
            valueBoxOutput("CalorieCounter")
        )
    )
))
