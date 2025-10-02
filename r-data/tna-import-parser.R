# Script reads the TNA CSV exports, does some light formatting in a dataframe
# then pushes all of it to ww2_log.  
#
# Set psswd and file before use.  Massive gap for privacy.
psswd <- 
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
###### DELETE PASSWORD before saving !!!! ####################################

  
reader <- "TNA_Search_Results_01-10-2025T20_13_40.csv" # Change me

###### DELETE PASSWORD before saving !!!! ####################################
# Don't forget to enter the passwd!!!
library(readr)
library(stringr)
library(RMySQL)

# Read CSV
tna_units <- read_csv(reader)
View(tna_units)
catalogue <- data.frame(tna_units)

# Format date
catalogue$Start.Date <- str_replace(str_replace(catalogue$Start.Date..num.,"(^.{4})","\\1-"),"(^.{7})","\\1-")
catalogue$End.Date <- str_replace(str_replace(catalogue$End.Date..num.,"(^.{4})","\\1-"),"(^.{7})","\\1-")

# push to DB
connection <- dbConnect(MySQL(), user = "duan", password = psswd, host = "localhost", dbname = "ww2_log")
dbWriteTable(connection, "tna_imp", catalogue, overwrite = TRUE, row.names = FALSE)
dbDisconnect(connection)

print("!!! Delete your password after use !!!")
