% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mplot3.xy.R
\name{mplot3.xy}
\alias{mplot3.xy}
\title{\code{mplot3}: XY Scatter and line plots}
\usage{
mplot3.xy(x, y, fit = NULL, formula = NULL, se.fit = FALSE,
  mod.params = NULL, error.x = NULL, error.y = NULL,
  cluster = NULL, cluster.params = list(), data = NULL,
  type = NULL, group = NULL, xlab = NULL, ylab = NULL,
  main = NULL, main.line = 0.5, main.adj = 0, main.col = NULL,
  main.font = 2, main.family = "", cex = 1.2, xlim = NULL,
  ylim = NULL, xpd = TRUE, xaxs = "r", yaxs = "r", rsq = NULL,
  rsq.pval = FALSE, rsq.side = 1, rsq.adj = 0.98,
  rsq.padj.shift = 0, rsq.col = NULL, fit.error = FALSE,
  fit.error.side = 1, fit.error.padj = NA, fit.error.col = NULL,
  xaxp = NULL, yaxp = NULL, scatter = TRUE, axes = TRUE,
  axes.equal = FALSE, axes.col = NULL, pty = "s", box = NULL,
  bty = "o", box.col = NULL, box.alpha = 1, box.lty = 1,
  box.lwd = 1.5, grid = FALSE, grid.nx = NULL, grid.ny = NULL,
  grid.col = NULL, grid.alpha = 1, grid.lty = 1, grid.lwd = 1.5,
  bg = NULL, plot.bg = NULL, annotation = NULL,
  annotation.col = NULL, tick.col = NULL, tck = 0.015,
  x.axis.side = 1, y.axis.side = 2, x.axis.at = NULL,
  y.axis.at = NULL, x.axis.labs = TRUE, y.axis.labs = TRUE,
  x.axis.padj = -1.1, xlab.line = 1.3, y.axis.padj = 0.9,
  ylab.line = 1.6, xlab.adj = 0.5, ylab.adj = 0.5, mar = c(2.5,
  2.5, 1.5, 1), col = NULL, pch = ifelse(is.null(point.bg.col), 16,
  21), point.cex = 0.85, point.col = NULL, point.bg.col = NULL,
  point.alpha = 0.66, line.col = NULL, line.alpha = 0.66, lty = 1,
  lwd = 2, marker.col = NULL, marker.alpha = 0.66,
  error.x.col = NULL, error.y.col = NULL, error.x.lty = 1,
  error.y.lty = 1, error.x.lwd = 1, error.y.lwd = 1,
  error.arrow.code = 3, fit.col = NULL, fit.lwd = 2.5,
  fit.alpha = 0.66, fit.legend = ifelse(is.null(fit), FALSE, TRUE),
  se.lty = "poly", se.lwd = 1, se.col = NULL, se.alpha = 0.5,
  se.times = 2, se.border = FALSE, se.density = NULL,
  xy.fit = NULL, xy.fit.col = NULL, firstpc = FALSE,
  firstpc.lty = 3, firstpc.col = NULL, hline = NULL,
  hline.col = NULL, hline.lwd = 1.5, hline.lty = 3, vline = NULL,
  vline.lwd = 1.5, vline.col = "blue", vline.lty = 3,
  diagonal = FALSE, diagonal.inv = FALSE, diagonal.lwd = 1.5,
  diagonal.lty = 1, diagonal.col = NULL, diagonal.alpha = 0.5,
  group.legend = NULL, group.title = NULL, group.names = NULL,
  group.side = 3, group.adj = 0.02, group.padj = 2, group.at = NA,
  fit.legend.col = NULL, fit.legend.side = 3, fit.legend.adj = 0.02,
  fit.legend.padj = 2, fit.legend.at = NA, labs.col = NULL,
  na.rm = TRUE, theme = getOption("rt.theme", "lightgrid"),
  palette = getOption("rt.palette", "ucsfPalette"), zero.lines = NULL,
  zero.col = NULL, zero.alpha = 1, zero.lty = 1, zero.lwd = 1.5,
  do.reorder = NULL, alpha.off = FALSE, autolabel = letters,
  new = FALSE, set.par = TRUE, par.reset = TRUE,
  return.lims = FALSE, pdf.width = 6, pdf.height = 6,
  verbose = FALSE, filename = NULL, ...)
}
\arguments{
\item{x}{Numeric vector or list of vectors for x-axis.
If \code{data} is provided, name of variable, unquoted.}

\item{y}{Numeric vector of list of vectors for y-axis
If \code{data} is provided, name of variable, unquoted.}

\item{fit}{String: \pkg{rtemis} model to calculate y ~ x fit. Options: see \code{modSelect}
Can also be Logical, which will give a GAM fit if TRUE. If you specify "NLA", the activation function should
be passed as a string.}

\item{formula}{Formula: Provide a formula to be solved using \link{s.NLS}. If provided, \code{fit} is
forced to \code{'nls'}. e.g. y ~ b * m ^ x for a power curve. Note: \code{nls} is prone to errors
and warnings, but is powerful. Use single letters for parameter names, no numbers.}

\item{se.fit}{Logical: If TRUE, draw the standard error of the fit}

\item{error.x}{Vector, float: Error in \code{x} (e.g. standard deviation) will be plotted as bars around point}

\item{error.y}{Vector, float: Error in \code{y} (e.g. standard deviation) will be plotted as bars around point}

\item{cluster}{String: Clusterer name. Will cluster \code{data.frame(x, y)} and
pass result to \code{group}. Run \link{clustSelect} for options}

\item{cluster.params}{List: Names list of parameters to pass to the \code{cluster} function}

\item{data}{(Optional) data frame, where \code{x} and \code{y} are defined}

\item{type}{String: "p" for points, "l" for lines, "s" for steps. Default = "p". If \code{x} and/or \code{y} contains multiple
vectors, \code{type} can be a vector, e.g. \code{c("p", "l", "l")} will give a set of points and two sets
of lines. Otherwise, \code{type} is recycled to length of x}

\item{group}{Vector: will be converted to factor.
If \code{data} is provided, name of variable, unquoted.}

\item{xlab}{String: x-axis label}

\item{ylab}{String: y-axis label}

\item{main}{String: Plot title}

\item{main.line}{Float: \code{mtext line} argument for the title. Higher numbers move title upwards.
Default = .5}

\item{main.adj}{Float: Plot title alignment (0 = left, .5 = center, 1 = right)}

\item{main.col}{Color for title. Defaults to black for theme "light" and "box", otherwise white}

\item{main.font}{Integer: 1: regular, 2: bold, 3: italic. See \code{par("font")} for more}

\item{main.family}{String: Font family to use. See \code{par("family")}}

\item{cex}{Float: Character expansion factor (See \code{?par})}

\item{xlim}{Float vector, length 2: x-axis limits}

\item{ylim}{Float vector, length 2: y-axis limits}

\item{rsq}{Logical: If TRUE, add legend with R-squared (if fit is not NULL)}

\item{rsq.pval}{Logical: If TRUE, add legend with R-squared and its p-value (if fit is not NULL)}

\item{axes}{Logical: Should the axes be drawn? Defaults to TRUE}

\item{axes.equal}{Logical: Should axes be equal? Defaults to FALSE}

\item{axes.col}{String: Color for axes values (box color set with \code{box.col})}

\item{pty}{"s" gives a square plot, "m" gives a plot that fills graphics device size. Defaults to "s"
(See \code{?par})}

\item{box}{Logical: Should a box be drawn around the plot? Defaults to TRUE for themes "box" and "darkbox"}

\item{bty}{Character: "o", "l", "7", "c", "u", or "]" result in a box resembling each character.
(See \code{?par})}

\item{box.col}{Box color}

\item{box.alpha}{Alpha for \code{box.col}}

\item{box.lty}{Box line type}

\item{grid}{Logical: Should grid be drawn?}

\item{grid.nx}{Integer: N of grid lines on the x axis.
Use with caution, probably along with \code{xaxs = "i"}}

\item{grid.ny}{Integer: N of grid lines on the y axis
Use with caution, probably along with \code{yaxs = "i"}}

\item{grid.col}{Grid color}

\item{grid.alpha}{Alpha for \code{grid.col}}

\item{grid.lty}{Grid line type (See \code{?par("lty")})}

\item{grid.lwd}{Grid line width}

\item{bg}{Background color. Defaults to white for themes "light" and "box", black otherwise.}

\item{annotation}{String: Add annotation at the bottom right of the plot}

\item{annotation.col}{Color for annotation}

\item{tck}{Float: Tick length. Can be negative (See \code{?par("tck")})}

\item{x.axis.padj}{Adjustment for the x axis tick labels position}

\item{xlab.line}{Adjustment for the x axis label position (See code{line} in \code{?mtext})}

\item{y.axis.padj}{Similar to \code{x.axis.padj} for the y axis}

\item{ylab.line}{Similar to \code{xlab.line} for the y axis}

\item{xlab.adj}{\code{adj} for \code{xlab} (See \code{?par})}

\item{ylab.adj}{\code{adj} for \code{ylab} (See \code{?par})}

\item{mar}{Vector, length 4: Margins; see \code{mar} in \code{?par}}

\item{fit.lwd}{Fit line width}

\item{se.lty}{How to draw the \code{se.fit} "poly" draws a polygon around the fit line,
otherwise an integer defines the lty (line type) for lines to be drawn}

\item{se.col}{Color for \code{se.fit}}

\item{se.alpha}{Alpha for \code{se.fit}}

\item{se.times}{Draw polygon or lines at +/- \code{se.times} * standard error of fit. Defaults to 2
(1.96 * standard error corresponds to 95\% confidence interval)}

\item{se.border}{Define border of polygon for \code{se.fit}.
See \code{border} in \code{graphics::polygon}}

\item{se.density}{Density of shading line of polygon for \code{se.fit}.
See \code{density} in \code{graphics::polygon}}

\item{group.legend}{Logical: If TRUE, place \code{group.names} in a legend}

\item{group.title}{String: Group title, shown above group names. e.g. if group names are
c("San Francisco", "Philadelphia"), \code{group.title} can be "Place of residence"}

\item{group.names}{(Optional) If multiple groups are plotted, use these names if \code{group.title = TRUE}}

\item{theme}{String: "light", "dark", "lightgrid", "darkgrid", "lightbox", "darkbox"
Default = "lightgrid" if no default \code{"rt.fit"} is set using \code{options}.
You can set a system-wide default in your \code{.Rprofile} by including a line like
options(rt.theme = 'lightgrid')}

\item{zero.lines}{Logical: If TRUE, draw lines at x = 0 and y = 0}

\item{zero.col}{Color for \code{zero.lines}}

\item{zero.alpha}{Color alpha for \code{zero.lines}}

\item{zero.lty}{Zero line line type}

\item{zero.lwd}{Zero line width}

\item{new}{Logical: If TRUE, add plot to existing plot. See \code{par("new")}}

\item{...}{Additional arguments to be passed to learner function}

\item{bot.lwd}{Box line width}
}
\description{
Plot points and lines with optional fits and standard error bands
}
\details{
This is relatively old code and may need a little cleaning up
}
\author{
Efstathios D. Gennatas
}
