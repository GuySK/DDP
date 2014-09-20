DDP
===

Data Science Specialization - John Hopkins - Developing Data Products

### This repo contains the Course Project's files

#### Table of contents

1. ui.R .................. Shiny User Interface
2. server.R .............. Shiny Server
3. index.Rmd ............. Source of Slidify deck

#### Running the App

Click here to run the application online on [RStudio's Shiny Server](https://guye.shinyapps.io/BMICalc/)

To run the app in your computer dowload the following files:

1. ui.R
2. server.R

Create a new directory named 'bmi' and place both files there. Then enter the following lines on your R console.

1. setwd("/your_path_to_bmi/bmi/..")    # position yourself on bmi's parent directory
2. library(shiny)                       # load Shiny
3. runApp("bmi", launch.browser=1)      # run application on default browser

