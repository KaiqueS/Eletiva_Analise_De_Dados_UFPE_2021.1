library( haven )
library( tidyverse )

# 1. Crie um data frame com pelo menos 500 casos e a seguinte composição: duas variáveis normais
#    de desvio padrão diferente, uma variável de contagem (poisson), uma variável de contagem com
#    dispersão (binomial negativa), uma variável binomial (0,1), uma variável qualitativa que
#    apresenta um valor quando a variável binomial é 0 e outro quando é 1, e uma variável de index.

#    As variáveis (normais, contagem e binomial) devem ser simuladas!!!

seed_rng <- addTaskCallback( function( ... ) { set.seed( 123 ); TRUE } )

primeira_normal <- rnorm( 500, sd = 1 )
segunda_normal <- rnorm( 500, sd = 10 )

contagem_poisson <- rpois( 500, lambda = 10 )
contagem_dispersao <- rnbinom( 500, size = 500, prob = 0.99 )
contagem_binomial <- rbinom( 500, 1, prob = 0.7 )

variavel_index <- c( rep( 1:500 ) )

banco_de_dados <- data_frame( primeira_normal, segunda_normal, contagem_poisson,
                              contagem_dispersao, contagem_binomial, variavel_index )

variavel_qualitativa <- banco_de_dados %>% transmute( qualidade = case_when( contagem_binomial == 0 ~ "caracteristica_0 ",
                                                                             contagem_binomial == 1 ~ "caracteristica_1" ) )

banco_de_dados <- cbind( banco_de_dados, variavel_qualitativa )

glimpse( banco_de_dados )

# 2. Centralize as variáveis normais.

banco_de_dados$primeira_normal <- banco_de_dados$primeira_normal - mean( banco_de_dados$primeira_normal )
banco_de_dados$segunda_normal <- banco_de_dados$segunda_normal - mean( banco_de_dados$segunda_normal )

glimpse( banco_de_dados )

# 3. Troque os zeros (0) por um (1) nas variáveis de contagem.

banco_de_dados <- banco_de_dados %>% mutate( contagem_binomial = case_when( contagem_binomial == 0 ~ 1,
                                                                            contagem_binomial == 1 ~ 0 ) ) %>%
                                     mutate( contagem_dispersao = case_when( contagem_binomial == 0 ~ 1,
                                                                             contagem_binomial == 1 ~ 0 ) )

glimpse( banco_de_dados )

# 4. Crie um novo data.frame com amostra (100 casos) da base de dados original.

novo_data_frame <- sample_n( banco_de_dados, 100 )

glimpse( novo_data_frame )
