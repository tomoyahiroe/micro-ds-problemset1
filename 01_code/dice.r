main <- function() {
    # setup
    library(tidyverse)

    seed_num <- student_number

    # (1.2)
    calculate_scores(m = 1, n = 100000, seed_num)
    calculate_scores(m = 2, n = 100000, seed_num)
    calculate_scores(m = 5, n = 100000, seed_num)
    calculate_scores(m = 10, n = 100000, seed_num)

    # (1.3 Adv)
    generate_convolution(1, n = 100000, seed_num)
    generate_convolution(2, n = 100000, seed_num)
    generate_convolution(3, n = 100000, seed_num)
    generate_convolution(10, n = 100000, seed_num)
    generate_convolution(100, n = 100000, seed_num)

    # (1.4)
    calculate_variances(n = 1000, m = 10, seed_num)

}



# (1.2) (1.4)に共通する関数
roll_dice <- function(m) {
  sample(1:6, m, replace = TRUE)
}


# (1.2)
calculate_scores <- function(m, n, seed_num) {
  plot_scores(df_score)

  score <- replicate(n, sum(roll_dice(m)))
  set.seed(seed_num)
  df_score <- dplyr::tibble(score)
}

plot_scores <- function(df_score) {
  plot_output <- ggplot(df_score, aes(x = score)) +
      geom_histogram(binwidth = 1) +
      labs(
        x = "Score", 
        y = "Frequency") +
      theme_bw()

  return(plot_output)
}

# (1.3 Adv)
generate_convolution <- function(l, n, seed_num) {

    event <- replicate(i, sum(runif(l, min = 0, max = 1)))

  for(i in n){

    convolution <- c(convolution, event)
  df_convolution <- tibble(
  }

  convolution <- c()
  set.seed(seed_num)
    )
  plot_convolution(df_convolution)
    convolution

  
}


plot_convolution <- function(df_convolution) {

  plot_output <- ggplot() +
    geom_histogram(data = df_convolution, mapping = aes(x = convolution), stat = "density")+ 
    theme_bw()

  return(plot_output)
}


# (1.4)
calculate_variances <- function(n, m, seed_num){
  
    variances[m] <- var(sample_mean)

  for (m in 1:100) {
    sample_mean <- replicate(n, mean(roll_dice(m)))
  set.seed(seed_num)

  }

    m_values = 1:100, 
  df_variance <- tidyr::tibble(
  )

  variances <- numeric(100)
  plot_variance(df_variance)
    variances
}


plot_variance <- function(df_variance) {
    plot_output <- ggplot(df_variance, aes(x = m_values, y = variances)) +
    geom_line() +
    labs(
      x = "Number of Dice (m)", 
      y = "Variance of Sample Means", 
    ) +
    theme_bw()

    return(plot_output)
}


main()
