## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE)
library(dplyr)
library(ggplot2)
library(maraca)

## ----fig.width=7, fig.height=6, echo = FALSE----------------------------------
data(hce_scenario_b)
maraca_dat <- maraca(
  data = hce_scenario_b,
  step_outcomes = c("Outcome I", "Outcome II", "Outcome III", "Outcome IV"),
  last_outcome = "Continuous outcome",
  fixed_followup_days = 3 * 365,
  column_names = c(outcome = "GROUP", arm = "TRTP", value = "AVAL0"),
  arm_levels = c(active = "Active", control = "Control")
)
mosaic_plot(maraca_dat, theme = "color2")

## ----maraca1, eval = TRUE-----------------------------------------------------
library(maraca)

data(hce_scenario_a)

## -----------------------------------------------------------------------------
maraca_dat <- maraca(
  data = hce_scenario_a,
  step_outcomes = c("Outcome I", "Outcome II", "Outcome III", "Outcome IV"),
  last_outcome = "Continuous outcome",
  fixed_followup_days = 3 * 365,
  column_names = c(outcome = "GROUP", arm = "TRTP", value = "AVAL0"),
  arm_levels = c(active = "Active", control = "Control")
)

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat)

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, highlight_ties = TRUE)

## ----fig.width=7, fig.height=6------------------------------------------------
maraca_with_win_odds <- maraca(
  data = hce_scenario_a,
  step_outcomes = c("Outcome I", "Outcome II", "Outcome III", "Outcome IV"),
  last_outcome = "Continuous outcome",
  fixed_followup_days = 3 * 365,
  column_names = c(outcome = "GROUP", arm = "TRTP", value = "AVAL0"),
  arm_levels = c(active = "Active", control = "Control"),
  compute_win_odds = TRUE
)
mosaic_plot(maraca_with_win_odds, win_prob = TRUE)

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, diagonal_line = FALSE)

## ----fig.width=7, fig.height=6------------------------------------------------
library(hce)

Rates_A <- c(1.72, 1.74, 0.58, 1.5, 1)
Rates_P <- c(2.47, 2.24, 2.9, 4, 6)

hce_dat <- simHCE(n = 2500, TTE_A = Rates_A, TTE_P = Rates_P,
                  CM_A = -3, CM_P = -6, CSD_A = 16, CSD_P = 15, fixedfy = 3,
                  seed = 31337)

mosaic_plot(hce_dat)

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat) +
  ggplot2::scale_fill_manual(values = c("red", "seagreen"), name = NULL)

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, theme = "maraca")

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, theme = "color1")

## ----fig.width=7, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, theme = "color2")

## ----fig.width=8, fig.height=6------------------------------------------------
mosaic_plot(maraca_dat, theme = "none")

