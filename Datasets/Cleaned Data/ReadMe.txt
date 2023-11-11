These two files are the cleaned data frames. There are two .RData files here:

1. cleanedDataWithoutCorrectiveActions.RData

This file contains a cleaned data frame with all variables indicated in the spreadsheet (I hope! If not, let us know and I can go in and get those variables for you.)

2. cleanedDataWithCorrectiveActions.Rdata

This file contains all the variables in the cleanedDataWithoutCorrectiveActions dataframe, but also contains variables containing corrective actions taken after the deviation occured. If you might need these variables for modeling, you can use this dataframe rather than the cleanedDataWithoutCorrectiveActions dataframe. This file has (somewhat) duplicate rows since multiple corrective actions could have been taken after a deviation. 

To load these dataframes into your environment, use the setwd() command to get to this folder, and then use the load() command with the name of the file, or you can download it and RStudio should add it to your global environment.

If you have questions, feel free to ask in the GroupMe!