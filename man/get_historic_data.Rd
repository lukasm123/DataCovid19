\name{get_historic_data}
\alias{get_historic_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
get_historic_data()
}
\description{
Returns a dataframe with historic numbers for Coronavirus for every country.
}
\usage{
get_historic_data()
}
%- maybe also 'usage' for other objects documented here.
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

## The function is currently defined as
function ()
{
    path = "https://pomber.github.io/covid19/timeseries.json"
    request = httr::GET(url = path)
    if (request$status_code == 200) {
        response = httr::content(request, as = "text", encoding = "UTF-8")
        df = jsonlite::fromJSON(response, flatten = TRUE)
        df_names <<- df
        data_historic <<- as.data.frame(df_names[1])[, 1]
        data_historic <<- data.frame(t(data_historic))
        data_historic <<- data_historic[-1, ]
        for (country in 1:171) {
            country_subset <- as.data.frame(df[country])
            country_subset[1] <- NULL
            data_historic <<- rbind(data_historic, t(country_subset))
        }
    }
    else {
        paste("Error! Status code: ", request$status_code)
    }
    colnames(data_historic) <- as.data.frame(df_names[1])[, 1]
    return(data_historic)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
