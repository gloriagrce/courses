blood_samples <- function(n, p = 0.115){
  sam <- rbinom(n = n, size = 1, p = p)
  sam <- ifelse(sam == 0, 'O', 'B')
  return(sam)
}