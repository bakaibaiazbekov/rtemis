% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factoryze.R
\name{factoryze}
\alias{factoryze}
\title{Factor Analysis}
\usage{
factoryze(x, n.factors = NULL, method = "minres",
  rotation = "oblimin", scores = "regression", cor = "cor",
  fa.n.iter = 100, omega.method = "minres",
  omega.rotation = c("oblimin", "simplimax", "promax", "cluster",
  "target"), omega.n.iter = 1, x.name = NULL, print.plot = TRUE,
  do.pa = TRUE, do.fa = TRUE, do.bifactor = TRUE,
  do.hclust = FALSE, verbose = TRUE, ...)
}
\arguments{
\item{x}{Data. Will be coerced to data frame}

\item{n.factors}{Integer: If NULL, will be estimated using parallel analysis}

\item{method}{String: Factor analysis method:
"minres": minimum residual (OLS), "wls": weighted least squares (WLS);
"gls": generalized weighted least squares (GLS); "pa": principal factor solution;
"ml": maximum likelihood;
"minchi": minimize the sample size weighted chi square when treating pairwise correlations with different
number of subjects per pair;
"minrank": minimum rank factor analysis.
Default = "minres"}

\item{rotation}{String: Rotation methods.
No rotation: "none";
Orthogonal: "varimax", "quartimax", "bentlerT", "equamax", "varimin", "geominT", "bifactor";
Oblique: "promax", "oblimin", "simplimax", "bentlerQ, "geominQ", "biquartimin", "cluster".
Default = "oblimin"}

\item{scores}{String: Factor score estimation method. Options: "regression",
"Thurstone": simple regression, "tenBerge": correlation-preserving, "Anderson", "Barlett".
Default = "regression"}

\item{cor}{String: Correlation method:
"cor": Pearson correlation, "cov": Covariance, "tet": tetrachoric, "poly": polychoric,
"mixed": mixed cor for a mixture of tetrachorics, polychorics, Pearsons, biserials, and polyserials,
"Yuleb": Yulebonett, "Yuleq" and "YuleY": Yule coefficients}

\item{fa.n.iter}{Integer: Number of iterations for factor analysis. Default = 100}

\item{omega.method}{String: Factor analysis method for the bifactor analysis. Same options as \code{method}
Default = "minres"}

\item{omega.rotation}{String: Rotation method for bifactor analysis:
"oblimin", "simplimax", "promax", "cluster", "target". Default = "oblimin"}

\item{omega.n.iter}{Integer: Number of iterations for bifactor analysis. Default = 1}

\item{x.name}{String: Name your dataset. Used for plotting}

\item{print.plot}{Logical: If TRUE, print plots along the way. Default = TRUE}

\item{do.pa}{Logical: If TRUE, perform parallel analysis. Default = TRUE}

\item{do.fa}{Logical: If TRUE, perform factor analysis. Default = TRUE}

\item{do.bifactor}{Logical: If TRUE, perform bifactor analysis. Default = TRUE}

\item{do.hclust}{Logical: If TRUE, perform hierarchical cluster analysis. Default = TRUE}

\item{verbose}{Logical: If TRUE, print messages to output. Default = TRUE}

\item{...}{Additional arguments to pass to \code{psych::fa}}
}
\description{
Perform parallel analysis, factor analysis, bifactor analysis
and hierarchical clustering
}
\details{
Consult \code{psych::fa} for more information on the parameters
}
\author{
Efstathios D. Gennatas
}
