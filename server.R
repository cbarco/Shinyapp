#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$BMI <- renderValueBox({
        user.bmi <- input$weight*10000 / input$height^2
        if (user.bmi < 18.5) {
            valueBox("Your BMI is Underweight", user.bmi, icon = icon("exclamation-triangle"), color = "teal", width = 5, href = NULL)
        } else if (user.bmi < 25) {
            valueBox("Your BMI is Normal", user.bmi, icon = NULL, color = "green", width = 5, href = NULL)
        } else if (user.bmi < 30) {
            valueBox("Your BMI is Overweight", user.bmi, icon = icon("exclamation-triangle"), color = "yellow", width = 5, href = NULL)
        } else {
            valueBox("Your BMI is Obese", user.bmi, icon = icon("exclamation-triangle"), color = "red", width = 5, href = NULL)
        }
    })
    
    output$IdealWeight <- renderValueBox({
        user.ideal <- 0.0022*input$height^2
        user.bmi <- input$weight*10000 / input$height^2
        if (user.bmi < 18.5) {
            valueBox("Your ideal weight is", user.ideal, icon=icon("exclamation-triangle"), color = "blue", width = 5, href = NULL)}
        else if (user.bmi < 25){
            valueBox("", "", icon = NULL, color = "red", width = 5, href = NULL)}
        else {
            valueBox("Your ideal weight is", user.ideal, icon=icon("exclamation-triangle"), color = "blue", width = 5, href = NULL)}
    })
    
    output$Weightloss <- renderValueBox({
        weight.loss <- input$weight - 0.0022*input$height^2
        weight.gain <- 0.0022*input$height^2 - input$weight
        user.bmi <- input$weight*10000 / input$height^2
        if (user.bmi < 18.5) {
            valueBox("You have to gain", weight.gain, icon=NULL, color = "blue", width = 5, href = NULL)}
        else if (user.bmi < 25){
            valueBox("", "", icon = NULL, color = "red", width = 5, href = NULL)}
        else {
            valueBox("You have to lose", weight.loss, icon=icon("exclamation-triangle"), color = "blue", width = 5, href = NULL)}
    })
    
    output$CalorieCounter <- renderValueBox({
        calories <- 24 * 0.0022*input$height^2
        calories.ideal <- 24 * input$weight
        user.bmi <- input$weight*10000 / input$height^2
        if (user.bmi < 18.5) {
            valueBox("Calories daily intake to reach weight goal", calories, icon=NULL, color = "blue", width = 5, href = NULL)}
        else if (user.bmi < 25){
            valueBox("Calories daily intake", calories.ideal, icon = NULL, color = "red", width = 5, href = NULL)}
        else {
            valueBox("Calories daily intake to reach weight goal", calories, icon=NULL, color = "blue", width = 5, href = NULL)}
    })
}