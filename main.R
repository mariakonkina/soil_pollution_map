#installing packages
install.packages("rjson")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("devtools")
install.packages("httr")
install.packages("varhandle")
install.packages("ggrepel")
devtools::install_github("dkahle/ggmap", force = TRUE)
install.packages("lintr")

#reaging libraries
library("rjson")
library("ggplot2")
library("dplyr")
library("devtools")
library("httr")
library("ggmap")
library("varhandle")
library("ggrepel")
library("lintr")

#read sources
source("R/functions.R")
source("R/plots.R")

#adding api variables
api_key <- "5e3250210ae739fdff8a2a110ddc6506"
data_url <- "https://apidata.mos.ru/v1/datasets/2452/rows?api_key="

#data import
data_import(api_key, data_url)

#making data frame
data_frame_making()

soil_df <<- soil_df %>%
  filter(year == "2018")

write.table(soil_df,
            file = "results/soil_df.csv",
            sep = ",",
            quote = FALSE,
            row.names = F)

soil_df_var <<- soil_df[soil_df$level %in% c("средний"), ]

#adding google api key
register_google(key = "AIzaSyDyp9clJ_Ii0LooFGs8l60-3GaONnn8_fI")

#making plots
plot_maker1()
plot_maker2()
