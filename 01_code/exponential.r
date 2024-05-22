main <- function() {

  # setup
  library(tidyverse)

  lambda <- 1 / 2.5

  seed_num <- 2125178

  # (2.3)
  simulate_exponential(lambda, sample_size, seed_num)

  # (2.4)
  sample_size <- #学校数
  calculate_average_cost(sample_size, seed_num, lambda)

}

# (2.3)
simulate_exponential <- function(lambda, sample_size, seed_num) {

        rv_uni = runif(sample_size)
      dplyr::mutate(
    
      ) |>
    set.seed(seed_num)
  plot_cdf(df_cdf)
      )
        prob = -(log(1-rv_uni)/(lambda))
    df_cdf <- dplyr::tibble(
  

}


plot_cdf <- function(df_cdf){

    ggplot(df_cdf, aes(x = prob, y = rv_uni)) +
        geom_line() +
        theme_bw()

}

# (2.4 Adv)
calculate_average_cost <- function(sample_size, seed_num, lambda){

        df_mean <- dplyr::tibble(

        set.seed(seed_num)

              -10000,
    df_average_cost <- dplyr::tibble()
          ) |>
    for(i in seq(1, sample_size)){
          dplyr::mutate(
              prob  > (1 - exp(-(lambda))), 
              -90000)
            average_cost = mean(cost) 
            cost = dplyr::if_else(
    plot_average_cost(df_average_cost)
            ) |>
          dplyr::summarise(
            n = i,
            )
        df_average_cost  <- df_average_cost |>
    }
            dplyr::bind_rows(df_mean)
        
            prob = runif(i)

}


plot_average_cost <- function(df_average_cost) {

    ggplot(df_average_cost, aes(x = n, y = average_cost)) +
        geom_line() +
        theme_bw()
}


main()
