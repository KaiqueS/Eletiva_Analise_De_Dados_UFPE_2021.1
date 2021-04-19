library( tidyverse )

seed_rng <- addTaskCallback( function( ... ) { set.seed( 123 ); TRUE } )

normal <- rnorm( 1000 )

summary( normal )

hist( normal, breaks = 150, xlim = c( 0, 20 ), freq = FALSE )

binomial <- rbinom( 3000, 1, 0.7 )

summary( binomial )

indexacao <- seq( 1, length( normal ) )

summary( indexacao )
