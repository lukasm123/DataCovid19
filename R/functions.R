#This function returns the latest numbers on coronavirus
#' @export
get_current_data = function(){

  #API request
  path = "https://coronavirus.m.pipedream.net/"
  request = httr::GET(url = path)
  request$status_code
  response <- httr::content(request, as = "text", encoding = "UTF-8")
  df <- jsonlite::fromJSON(response, flatten = TRUE)

  #Extract data
  currentData <<- as.data.frame(df$rawData)

}
#This function returns the historic data per country
#' @export
get_historic_data = function(){

  #API request
  path = "https://pomber.github.io/covid19/timeseries.json"
  request = httr::GET(url = path)
  if (request$status_code == 200){

    response = httr::content(request, as = "text", encoding = "UTF-8")
    df = jsonlite::fromJSON(response, flatten = TRUE)
    df_names <<- df

    #Select dates as columns
    data_historic <<- as.data.frame(df_names[1])[,1]
    data_historic <<- data.frame(t(data_historic))
    data_historic <<- data_historic[-1,]

    #Extract every country
    for (country in 1:171){
      country_subset <-  as.data.frame(df[country])
      country_subset[1]  <-  NULL
      data_historic <<- rbind(data_historic, t(country_subset))
    }
  }
  else{
    paste("Error! Status code: ", request$status_code)
  }
  colnames(data_historic) <- as.data.frame(df_names[1])[,1]
  return(data_historic)
}
