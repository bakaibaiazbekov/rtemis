% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dplot3.R
\name{dplot3}
\alias{dplot3}
\title{Dynamic Plots (\code{plotly})}
\usage{
dplot3(x, y = NULL, mode = NULL, group = NULL, point.size = 7,
  point.color = NULL, point.alpha = 0.66, point.symbol = "circle",
  point.labels = NULL, fit = "none", axes.fixedratio = FALSE,
  xlim = NULL, ylim = NULL, gam.k = 4, fit.width = 3,
  fit.color = "#18A3AC", fit.alpha = 1, se.fit = TRUE,
  se.times = 2, se.color = NULL, se.alpha = 0.2,
  density.color = "#18A3AC", density.alpha = 0.66, density.width = 1,
  density.mean = FALSE, density.mean.width = 2, main = NULL,
  xlab = "x", ylab = "y", font.family = "Helvetica Neue",
  font.color = "gray50", font.size = 18, axes = FALSE, grid = TRUE,
  grid.col = "#fff", zero.lines = TRUE, zero.col = "#7F7F7F",
  zero.lwd = 1, legend = TRUE, legend.bgcol = "#00000000",
  legend.bordercol = "gray50", legend.borderwidth = 0,
  legend.fontcol = "#000000", margins = c(60, 70, 40, 20), pad = 4,
  bg = "#E5E5E5", showlegend = TRUE, legend.xy = c(0, 1),
  axes.square = FALSE, height = NULL, width = NULL)
}
\arguments{
\item{x}{Numeric vector. x coordinates}

\item{y}{Numeric vector. y coordinates}

\item{mode}{String: "scatter" or "density"}

\item{group}{String: Name of variable to group by (not yet functional)}

\item{point.size}{Numeric scalar or vector}

\item{point.color}{Color of points}

\item{point.alpha}{Float: Alpha of points}

\item{point.symbol}{String: "circle", "square"; see plotly documentation for more
Default = "circle"}

\item{point.labels}{String, optional: Point labels displayed on mouse over}

\item{fit}{String, optional: "lm", "gam"}

\item{gam.k}{Integer: Number of bases for \code{mgcv::gam}'s smoothing spline}

\item{fit.width}{Float: Width of fit line}

\item{fit.color}{Color of fit line}

\item{fit.alpha}{Float: Alpha of fit line}

\item{se.fit}{Logical: If TRUE, draws +/- \code{se.times * standard error}}

\item{se.times}{Float: Multiplier for standard error band. Default = 2}

\item{se.color}{Color of S.E. band}

\item{se.alpha}{Float: Alpha of S.E. band}

\item{density.color}{Color of density line}

\item{density.alpha}{Float: Alpha of density line}

\item{density.width}{Integer: Width of density line}

\item{density.mean}{Logical: If TRUE, draw vertical line at \code{mean(x)}}

\item{density.mean.width}{Integer: Width of \code{density.mean} line. Default = 2}

\item{main}{String: Plot title}

\item{xlab}{String: x-axis label}

\item{ylab}{String: y-axis label}

\item{font.family}{String: Axes' legends' font family}

\item{font.color}{Font color}

\item{font.size}{Integer: Font size}

\item{axes}{Logical: If TRUE, show x and y axes. Default = TRUE}

\item{grid}{Logical: If TRUE, draw grid lines. Default = FALSE}

\item{pad}{Numeric: Distance of tick labels from axes}

\item{showlegend}{Logical: If TRUE, show legends}

\item{legend.xy}{Vector, length 2 [0, 1]: x, y coordinates of legend. 0 means left and bottom for x and y axis
respectively; 1 means right and top. Default = c(0, 1) (i.e. top-left)}

\item{axes.square}{Logical: If TRUE, make axes square}

\item{margin}{Vector, length 4: Plot margins. Default = c(60, 70, 40, 20)}
}
\description{
Build dynamic plots that can be viewed in RStudio Viewer, a web browser, or exported to a static image.
Support for (x, y) scatter plots with optional fit line(lm, or gam), and density plots.
}
\seealso{
\link{mplot3}
}
\author{
Efstathios D. Gennatas
}
