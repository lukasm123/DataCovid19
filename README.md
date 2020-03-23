# DataCovid19
R library for getting latest and historic numbers on Coronavirus via API.

Install with devtools::install_github("lukasm123/DataCovid19")

## get_current_data():
Creates dataframe with latest numbers on Coronavirus.

## get_historic_data():
Creates dataframe with historic data for every country.

(Use "colnames(data_historic) <- as.data.frame(df_names[1])[,1]" to get date as column names. I will solve this problem in a later version.)
