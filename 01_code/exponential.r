main <- function() {
  # setup
  library(tidyverse)

  lambda <- 1 / 2.5

  seed_num <- 2125178

  # (2.3)
  exponential_plot <- simulate_exponential(lambda, 50, seed_num)
  ggplot2::ggsave(
    filename = "2-3_plot.png",
    plot = exponential_plot,
    path = here::here("01_code", "output"),
    device = "png"
  )

  # (2.4)
  #  sample_size <- # 学校数
  #    calculate_average_cost(sample_size, seed_num, lambda)
}

# (2.3)
simulate_exponential <- function(lambda, sample_size, seed_num) {
  set.seed(seed_num)
  df_cdf <- dplyr::tibble(
    rv_uni = runif(sample_size)
  ) |>
    dplyr::mutate(
      prob = -(log(1 - rv_uni) / (lambda))
    )
  plot_cdf(df_cdf)
}


plot_cdf <- function(df_cdf) {
	ggplot2::ggplot(df_cdf, ggplot2::aes(x = prob, y = rv_uni)) +
    ggplot2::geom_line() +
    ggplot2::theme_bw()
}

# (2.4 Adv)
# calculate_average_cost <- function(sample_size, seed_num, lambda){
#
#        df_mean <- dplyr::tibble(
#
#        set.seed(seed_num)
#
#              -10000,
#    df_average_cost <- dplyr::tibble()
#          ) |>
#    for(i in seq(1, sample_size)){
#          dplyr::mutate(
#              prob  > (1 - exp(-(lambda))),
#              -90000)
#            average_cost = mean(cost)
#            cost = dplyr::if_else(
#    plot_average_cost(df_average_cost)
#            ) |>
#        df_average_cost  <- df_average_cost |>
#          dplyr::summarise(
#            n = i,
#            )
#    }
#            dplyr::bind_rows(df_mean)
#
#            prob = runif(i)
#
# }


plot_average_cost <- function(df_average_cost) {
  ggplot2::ggplot(df_average_cost, ggplot2::aes(x = n, y = average_cost)) +
    ggplot2::geom_line() +
    ggplot2::theme_bw()
}


main()
