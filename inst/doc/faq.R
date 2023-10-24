## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE)
library(maraca)

## ----fig.width = 7, fig.height = 6--------------------------------------------
library(hce)

Rates_A <- c(1.72, 1.74, 0.58, 1.5, 1)
Rates_P <- c(2.47, 2.24, 2.9, 4, 6)

hce_dat <- simHCE(n = 2500, TTE_A = Rates_A, TTE_P = Rates_P,
                  CM_A = -3, CM_P = -6, CSD_A = 16, CSD_P = 15, fixedfy = 3,
                  seed = 242424)

winRatio <- calcWINS(hce_dat)$WR1

plot <- plot(hce_dat, compute_win_odds = FALSE)
plot <-
  plot  +
  ggplot2::annotate(
    geom = "label",
    x = 0,
    y = Inf,
    label = paste(
      "Win ratio: ", round(winRatio[1,"WR"], 2),
      "\n95% CI: ", round(winRatio[1,"LCL1"], 2), " - ",
      round(winRatio[1,"UCL1"], 2), "\n",
      "p-value: ", format.pval(winRatio[1,"Pvalue1"], digits = 3, eps = 0.001),
      sep = ""
    ),
    hjust = 0, vjust = 1.4, size = 3
  )

plot

