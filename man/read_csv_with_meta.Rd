% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-csv.R
\name{read_csv_with_meta}
\alias{read_csv_with_meta}
\title{Read a csv file, using the spec in metadata}
\usage{
read_csv_with_meta(file, metadata)
}
\arguments{
\item{file}{String, path to the file}

\item{metadata}{A list object following the csv-control template}
}
\value{
A dataframe
}
\description{
metadata should follow the csv-control template, which is based around the
readr::read_csv function, and which can accept all the commonly user arguments
from this function.
}
