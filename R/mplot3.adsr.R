# mplot3.adsr.R
# ::rtemis::
# 2017 Efstathios D. Gennatas egenn.github.io

#' \code{mplot3}: ADSR Plot
#'
#' Plot Attack Decay Sustain Release Envelope Generator using \code{mplot3}
#'
#' Learn more:
#' (https://en.wikipedia.org/wiki/Synthesizer#Attack_Decay_Sustain_Release_.28ADSR.29_envelope "ADSR Wikipedia")
#' @param Attack Float: Attack time (in milliseconds)
#' @param Decay Float: Decay time (in milliseconds)
#' @param Sustain Float: Sustain Level (percent)
#' @param Release Float: Release time (in milliseconds)
#' @param Velocity Float: Velocity (percent)
#' @param I Float: Note on time (in milliseconds)
#' @param O Float: Note off time (in milliseconds)
#' @param theme String: "light" or "dark" (Default)
#' @param ... Additional arguments to pass to \link{mplot3.xy}
#' @author Efstathios D. Gennatas
#' @export

mplot3.adsr <- function(Attack = 300,
                        Decay = 160,
                        Sustain = 40,
                        Release = 500,
                        Velocity = 80,
                        I = 200,
                        O = 1800,
                        lty = 1,
                        lwd = 4,
                        main = "ADSR Envelope Generator",
                        main.line = 1.6,
                        main.col = "white",
                        Attack.col = pennCol$lighterYellow,
                        Decay.col = pennCol$orange,
                        Sustain.col = pennCol$lighterRed,
                        Release.col = pennCol$lighterBlue,
                        Decay.nl = FALSE,
                        draw.poly = FALSE,
                        poly.alpha = .15,
                        draw.verticals = TRUE,
                        v.lty = 1,
                        v.lwd = .8,
                        arrow.code = 2,
                        arrow.length = .09,
                        grid = FALSE,
                        grid.lty = 1,
                        grid.lwd = .4,
                        grid.col = NULL,
                        zero.col = "gray50",
                        theme = "dark",
                        labs.col = "gray70",
                        # axes.col = "",
                        tick.col = "gray70",
                        on.lty = 2,
                        on.lwd = 7,
                        on.alpha = .4,
                        on.col = "gray70",
                        off.col = "gray70",
                        pty = "m",
                        mar = c(3, 3, 3.2, .5),
                        xaxs = "i",
                        yaxs = "i",
                        par.reset = TRUE, ...) {

  # [ ENVELOPE ] ====
  A <- Attack
  D <- Decay
  S <- Sustain
  R <- Release
  V <- Velocity
  x <- c(0, I, I + A, I + A + D, O, O + R)
  y <- c(0, 0, V, S, S, 0)

  # [ PLOT ] ====
  par.orig <- par(no.readonly = TRUE)
  if (par.reset) on.exit(suppressWarnings(par(par.orig)))
  mplot3.xy(x, y, type = 'l', theme = theme, xaxs = xaxs, yaxs = yaxs,
            scatter = FALSE, zero.lines = FALSE,
            xlab = "Time (ms)", ylab = "% Velocity",
            xlim = c(0, O + R + 300),
            ylim = c(0, 100),
            line.col = pennCol$lightestBlue, lwd = 4,
            par.reset = FALSE, labs.col = labs.col,
            tck = -.02, tick.col = tick.col,
            grid = grid, grid.lty = grid.lty, grid.lwd = grid.lwd, grid.col = grid.col,
            zero.col = zero.col,
            pty = pty,
            mar = mar,
            main = main, main.col = main.col, main.line = main.line, ...)

  # [ Shading ] ====
  if (draw.poly) {
    polygon(c(I, I + A, I + A, I), c(0, 0, V, V), col = colorAdjust(Attack.col, poly.alpha))
    polygon(c(I + A, I + A + D, I + A + D, I + A), c(0, 0, V, V), col = colorAdjust(Decay.col, poly.alpha))
    polygon(c(I + A + D, O, O, I + A + D), c(0, 0, S, S), col = colorAdjust(Sustain.col, poly.alpha))
    polygon(c(O, O + R, O + R, O), c(0, 0, S, S), col = colorAdjust(Release.col, poly.alpha))
  }

  # Note ON
  # lines(c(I, O), c(-2, -2), col = adjustcolor(on.col, on.alpha),
  #       lwd = on.lwd, lty = on.lty)
  # Pre
  lines(c(0, I), c(0, 0), col = zero.col, lwd = lwd, lty = lty, xpd = TRUE)
  # Attack
  lines(c(I, I + A), c(0, V), col = Attack.col, lwd = lwd, lty = lty)
  # Decay
  if (!Decay.nl) {
    lines(c(I + A, I + A + D), c(V, S), col = Decay.col, lwd = lwd, lty = lty)
  } else {
    Dx <- seq(I + A, I + A + D, D/100)
    Dy <- seq(V, S/100 * V, diff(c(V, S)) / 100) + ((-50:50) ^ 4 - 50^4) / 125
    lines(Dx, Dy, col = Decay.col, lwd = lwd, lty = lty)
  }
  # Sustain
  lines(c(I + A + D, O), c(S, S), col = Sustain.col, lwd = lwd, lty = lty)
  # Release
  lines(c(O, O + R), c(S, 0), col = Release.col, lwd = lwd, lty = lty)
  # Post
  lines(c(O + R, 2 * O + R), c(0, 0), col = zero.col, lwd = lwd, lty = lty, xpd = TRUE)

  # [ Verticals ] ====
  if (draw.verticals) {
    # Note ON
    abline(v = I, lwd = v.lwd, lty = v.lty, col = on.col)
    text(I, 105, "Note ON", col = on.col, xpd = TRUE, font = 2)
    # Peak Velocity
    abline(v = I + A, lwd = v.lwd, lty = v.lty, col = Attack.col)
    # Decay end
    abline(v = I + A + D, lwd = v.lwd, lty = v.lty, col = Decay.col)
    # Sustain end - Note OFF
    abline(v = O, lwd = v.lwd, lty = v.lty, col = Sustain.col)
    text(O, 105, "Note OFF", col = off.col, xpd = TRUE, font = 2)
    # Release end
    abline(v = O + R, lwd = v.lwd, lty = v.lty, col = Release.col)
  }

  # [ Arrows ] ====
  # Attack Time
  arrows(x0 = I, y0 = V/2, x1 = I + A, V/2,
         code = arrow.code, length = arrow.length, lwd = 1.5, lty = 1, col = Attack.col)
  # Decay Time
  arrows(x0 = I + A, y0 = S + (V - S)/2, x1 = I + A + D, S + (V - S)/2,
         code = arrow.code, length = arrow.length, lwd = 1.5, lty = 1, col = Decay.col)
  # Sustain Level
  arrows(x0 = I + A + D + (O - I - A - D)/2, y0 = 0, x1 = I + A + D + (O - I - A - D)/2, y1 = S,
         code = arrow.code, length = arrow.length, lwd = 1.5, lty = 1, col = Sustain.col)
  # Release Time
  arrows(x0 = O, y0 = S/2, x1 = O + R, y1 = S/2,
         code = arrow.code, length = arrow.length, lwd = 1.5, lty = 1, col = Release.col)

  # [ MAIN ] ====
  # mtext(text = c("A", "D", "S", "R", "Envelope Generator"), side = 3,
  #       font = 2, cex = 1.2, adj = c(0, .03, .06, .09, .2), line = 1.5,
  #       col = c(Attack.col, Decay.col, Sustain.col, Release.col, "white"))

  # [ Legend ] ====
  # legend(O + R, 100, legend = c("Attack", "Decay", "Sustain", "Release"),
  #        col = c(Attack.col, Decay.col, Sustain.col, Release.col))
  # legend("topright",
  #        legend = c("Attack Time", "Decay Time", "Sustain Level", "Release Time"),
  #        text.col = c(Attack.col, Decay.col, Sustain.col, Release.col), bty = "n")
  mtext(c("Attack Time", "Decay Time", "Sustain Level", "Release Time"),
        side = 3, font = 2,
        col = c(Attack.col, Decay.col, Sustain.col, Release.col),
        adj = .98, padj = c(2, 3.7, 5.4, 7.1), cex = 1.2)

} # rtemis::adsr
