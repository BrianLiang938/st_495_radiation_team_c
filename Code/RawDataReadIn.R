library(tidyverse)
library(readxl)

# If someone needs this - make sure to change the command below so you can access the data!
# This is what I have it as on my machine.
setwd("~/Documents/ST 495/FinalProject/st_495_radiation_team_c/Raw Data")

#ACC-Pat_Users-New.xlsx
users <- read_csv("ACC-Pat_Users-New.xlsx - Pat_Users.csv")
users <- users[-c(22,23,24),]

#ACC-Pat_Category_Codes-New.xlsx
catCodes <- read_csv("ACC-Pat_Category_Codes-New.xlsx - Pat_Category_Codes.csv")
catCodes <- catCodes[-c(3135,3136,3137),]

#ACC-Patient_Master-Chart ID DELETED-New.xlsx
patientMasterChart <- 
  read_csv("ACC-Patient_Master-Chart ID DELETED-New.xlsx - Patient_Master.csv")
patientMasterChart <- patientMasterChart[-c(569,568,567),]

#ACC-Pat_Tasks-Chart ID DELETED-New.xlsx
patTasks <-
  read_csv("ACC-Pat_Tasks-Chart ID DELETED-New.xlsx - Pat_Tasks.csv")
patTasks <- patTasks[-c(161,162,163),]

#ACC-Pat_Roles-New.xlsx
patRoles <-
  read_csv("ACC-Pat_Roles-New.xlsx - Pat_Roles.csv")
patRoles <- patRoles[-c(14,15,16),]

#ACC-Pat_Error_Lookup-New.xlsx
errorLookup <-
  read_csv("ACC-Pat_Error_Lookup-New.xlsx - Pat_Error_Lookup.csv")
errorLookup <- errorLookup[-c(1308,1309,1310),]

#ACC-Pat_Dailyportions-New.xlsx
DailyPortions <-
  read_csv("ACC-Pat_Dailyportions-New.xlsx - Pat_Dailyportions.csv")
DailyPortions <- DailyPortions[-c(35,34,33),]

#ACC-Pat_Corrective_Node-New.xlsx
correctiveNode <-
  read_csv("ACC-Pat_Corrective_Node-New.xlsx - Pat_Correctice_Node.csv")
correctiveNode <- correctiveNode[-c(3243,3242,3241),]

#ACC-Pat_Corrections-New.xlsx
corrections <-
  read_csv("ACC-Pat_Corrections-New.xlsx - Pat_Corrections.csv")
corrections <- corrections[-c(479,478,477),]

#ACC-Pat_Approvals-New.xlsx
patApprovals <-
  read_csv("ACC-Pat_Approvals-New.xlsx - Pat_Approvals.csv")
patApprovals <- patApprovals[-c(157,156,155),]

#Acc-Error_Master-Chart ID DELETED-New.xlsx
errorMasterChart <-
  read_csv("ACC-Error_Master-Chart ID DELETED-New.xlsx - Error_Master.csv")
errorMasterChart <- errorMasterChart[-c(127,126,125),]

#Acc-Error_Master-Chart ID DELETED-New.xlsx
errorMasterChart <-
  read_excel("/Users/david/Desktop/Raw_Data/ACC - New/ACC-Error_Master-Chart ID DELETED-New.xlsx")
errorMasterChart <- errorMasterChart %>%
  filter((str_detect(DEVID, "\\d"))) %>%
  separate(ERROR_CODE, into=c('start', 'CATEGORY1_ID', 'CATEGORY2_ID', 'ATTRIBUTE_ID'), sep = '-')
errorMasterChart <- errorMasterChart[-c(21,27,29,31,33,67,86,94,96),]

# The Datasets folder holds the datasets just read in.
# To access them, just use load("nameoffile.RData") to read it in to the environment.
setwd("~/Documents/ST 495/FinalProject/st_495_radiation_team_c/Datasets")
save(users, file = "users.RData")
save(catCodes, file = "catCodes.RData")
save(patientMasterChart, file = "patientMasterChart.RData")
save(patTasks, file = "patTasks.RData")
save(patRoles, file = "patRoles.RData")
save(errorLookup, file = "errorLookup.RData")
save(DailyPortions, file = "DailyPortions.RData")
save(correctiveNode, file = "correctiveNode.RData")
save(corrections, file = "corrections.RData")
save(patApprovals, file = "patApprovals.RData")
save(errorMasterChart, file = "errorMasterChart.RData")


