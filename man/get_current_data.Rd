\name{get_current_data}
\alias{get_current_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
get_current-data()
}
\description{
Returns a dataframe with current numbers on Coronavirus.

}
\usage{
get_current_data()
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
    path = "https://coronavirus.m.pipedream.net/"
    request = httr::GET(url = path)
    request$status_code
    response <- httr::content(request, as = "text", encoding = "UTF-8")
    df <- jsonlite::fromJSON(response, flatten = TRUE)
    currentData <<- as.data.frame(df$rawData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
