% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/winOddsPlots.R
\name{cumulative_plot}
\alias{cumulative_plot}
\alias{dustin}
\alias{dustin_plot}
\alias{cumulative_plot.default}
\alias{cumulative_plot.maraca}
\alias{cumulative_plot.hce}
\title{Plotting the cumulated components of win odds}
\usage{
cumulative_plot(x, ...)

dustin(x, ...)

dustin_plot(x, ...)

\method{cumulative_plot}{default}(x, ...)

\method{cumulative_plot}{maraca}(
  x,
  theme = "maraca",
  include = c("win odds", "win ratio"),
  reverse = FALSE,
  ...
)

\method{cumulative_plot}{hce}(
  x,
  step_outcomes = NULL,
  last_outcome = "C",
  arm_levels = c(active = "A", control = "P"),
  fixed_followup_days = NULL,
  theme = "maraca",
  include = c("win odds", "win ratio"),
  reverse = FALSE,
  lowerBetter = FALSE,
  ...
)
}
\arguments{
\item{x}{an object of S3 class 'maraca' or 'hce'.}

\item{\dots}{not used}

\item{theme}{Choose theme to style the plot. The default theme is "maraca".
Options are "maraca", "color1", "color2" and none".
For more details, check the vignette called
"Maraca Plots - Plotting win odds".}

\item{include}{Vector or single string indicating which statistics to
include in the right hand side plot. Acceptable values are
"win odds" and/or "win ratio". Default is c("win odds", "win ratio").}

\item{reverse}{Flag indicating if the cumulated outcomes should be
displayed in order from top to bottom (FALSE, the default)
or in reverse (TRUE).}

\item{step_outcomes}{A vector of strings containing the outcome labels
for all outcomes displayed as part of the step function
on the left side of the plot.
The order is kept for the plot.
By default (when set to NULL) this is automatically
updated by taking the non-continuous outcomes from
the GROUP variable in alphabetical order.}

\item{last_outcome}{A single string containing the last outcome label
displayed on the right side of the plot.
Default value "C".}

\item{arm_levels}{A named vector of exactly two strings, mapping the
values used for the active and control arms to the values
used in the data. The names must be "active" and "control"
in this order. Note that this parameter only need to
be specified if you have labels different from
 "active" and "control".}

\item{fixed_followup_days}{Not needed if HCE object contains information
on fixed follow-up days in the study
(column PADY or TTEfixed,
depending on hce version).
Otherwise, this argument must be specified.
Note: If argument is specified and HCE object
contains PADY or TTEfixed column, then
fixed_followup_days argument is used.}

\item{lowerBetter}{Flag for the final outcome variable, indicating if
lower values are considered better/advantageous.
This flag is need to make sure the win odds are
calculated correctly.
Default value is FALSE, meaning higher values
are considered advantageous.}
}
\value{
Cumulative plot as a patchwork list. Individual plots can
        be accessed like list items (plot[[1]] and plot[[2]]).
}
\description{
Generic function to create a plot showing the components used in
calculating win odds (wins and ties) cumulated for all
outcomes for a hierarchical endpoint.
Implemented for objects of type 'maraca' and 'hce'.
}
\details{
Note that for this plot, if applying to a maraca object, in the
original maraca() function run the argument "compute_win_odds" has
to be set to TRUE.

Check the vignette "Maraca Plots - Plotting win odds" for more details.
}
\examples{

data(hce_scenario_a)

maraca_dat <- maraca(data = hce_scenario_a,
                     step_outcomes = c("Outcome I", "Outcome II",
                                      "Outcome III", "Outcome IV"),
                     last_outcome = "Continuous outcome",
                     fixed_followup_days = 3 * 365,
                     column_names = c(outcome = "GROUP",
                                      arm = "TRTP",
                                      value = "AVAL0"),
                     arm_levels = c(active = "Active",
                                    control = "Control"),
                     compute_win_odds = TRUE
                     )

cumulative_plot(maraca_dat)

Rates_A <- c(1.72, 1.74, 0.58, 1.5, 1)
Rates_P <- c(2.47, 2.24, 2.9, 4, 6)
hce_dat <- hce::simHCE(n = 2500, TTE_A = Rates_A, TTE_P = Rates_P,
             CM_A = -3, CM_P = -6, CSD_A = 16, CSD_P = 15, fixedfy = 3,
             seed = 31337)

cumulative_plot(hce_dat)

}
