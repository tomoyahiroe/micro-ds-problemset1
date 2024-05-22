main <- function() {
  # setup
  library(tidyverse)

  seed_num <- 2125178

  #  (1.2)
  m1 <- calculate_scores(m = 1, n = 100000, seed_num)
  m2 <- calculate_scores(m = 2, n = 100000, seed_num)
  m3 <- calculate_scores(m = 5, n = 100000, seed_num)
  m4 <- calculate_scores(m = 10, n = 100000, seed_num)

  compiled_plot <- gridExtra::grid.arrange(m1, m2, m3, m4, nrow = 2)
  ggplot2::ggsave(
    filename = "1-2_plot.png",
    plot = compiled_plot,
    path = here::here("01_code", "output"),
    device = "png"
  )

  # (1.3 Adv)
  #generate_convolution(1, n = 100000, seed_num)
  #generate_convolution(2, n = 100000, seed_num)
  #generate_convolution(3, n = 100000, seed_num)
  #generate_convolution(10, n = 100000, seed_num)
  #generate_convolution(100, n = 100000, seed_num)

  #  (1.4)
  variances_plot <- calculate_variances(n = 1000, m = 10, seed_num)
  ggplot2::ggsave(
    filename = "1-4_plot.png",
		plot = variances_plot,
    path = here::here("01_code", "output"),
    device = "png"
  )
}


# (1.2) (1.4)に共通する関数
roll_dice <- function(m) {
  sample(1:6, m, replace = TRUE)
}


# (1.2)
calculate_scores <- function(m, n, seed_num) {
  set.seed(seed_num)
  score <- replicate(n, sum(roll_dice(m)))
  df_score <- dplyr::tibble(score)
  plot_scores(df_score)
}

plot_scores <- function(df_score) {
  plot_output <- ggplot2::ggplot(df_score, ggplot2::aes(x = score)) +
    ggplot2::geom_histogram(binwidth = 1) +
    ggplot2::labs(
      x = "Score",
      y = "Frequency"
    ) +
    ggplot2::theme_bw()

  return(plot_output)
}

# (1.3 Adv)
generate_convolution <- function(l, n, seed_num) {
  event <- replicate(i, sum(runif(l, min = 0, max = 1)))

  for (i in n) {

  }
  convolution <- c(convolution, event)
  df_convolution <- tibble()
  convolution <- c()
  set.seed(seed_num)
  plot_convolution(df_convolution)
  convolution
}


plot_convolution <- function(df_convolution) {
  plot_output <- ggplot2::ggplot() +
    geom_histogram(data = df_convolution, mapping = aes(x = convolution), stat = "density") +
    theme_bw()

  return(plot_output)
}


# (1.4)
calculate_variances <- function(n, m, seed_num) {
  variances <- numeric(100)
  for (m in 1:100) {
    sample_mean <- replicate(n, mean(roll_dice(m)))
    set.seed(seed_num)
    variances[m] <- var(sample_mean)
  }

  df_variance <- tidyr::tibble(
    m_values = 1:100,
    variances
  )

  plot_variance(df_variance)
}


plot_variance <- function(df_variance) {
  plot_output <- ggplot2::ggplot(df_variance, ggplot2::aes(x = m_values, y = variances)) +
    ggplot2::geom_line() +
    ggplot2::labs(
      x = "Number of Dice (m)",
      y = "Variance of Sample Means",
    ) +
    ggplot2::theme_bw()

  return(plot_output)
}


main()
