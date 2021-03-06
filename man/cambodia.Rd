% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cambodia}
\alias{cambodia}
\title{Aggregated summary birth histories derived from microdata}
\format{
A data frame
}
\source{
\href{https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1000253}{PLoS MEDICINE}
}
\usage{
data(cambodia)
}
\description{
Fake summary data used to demonstrate the application of Cohort-derived and Period-derived methods
developed by Rajaratnam et al in 2010.
}
\details{
\if{html}{\out{<div class="r">}}\preformatted{## codes used to derive the dataset `cambodia`

## install.packages("tidyverse", dependencies = TRUE)
## install.packages("devtools", dependencies = TRUE)
## devtools::install_github("myominnoo/mStats")

library(tidyverse)
library(mStats)
data(microdata)
cambodia <- microdata \%>\%
  filter(sex == 2) \%>\%
  filter(age >= 15 & age < 50) \%>\%
  egen(age, seq(15, 45, 5), new_var = "agegroup") \%>\%
  generate(n, 1 * wtper) \%>\%
  replace(ceb, ceb * wtper) \%>\%
  replace(cd, cd * wtper) \%>\%
  group_by(iso3, svdate, agegroup) \%>\%
  summarise(women = sum(n),
            child_born = sum(ceb),
            child_dead = sum(cd)) \%>\%
  rename(agegrp = agegroup) \%>\%
  data.frame()
}\if{html}{\out{</div>}}
}
\references{
Rajaratnam JK, Tran LN, Lopez AD, Murray CJL (2010) Measuring Under-Five Mortality: Validation of New Low-Cost Methods. PLOS Medicine 7(4): e1000253.
(\doi{10.1371/journal.pmed.1000253}{10.1371/journal.pmed.1000253})
}
\keyword{datasets}
