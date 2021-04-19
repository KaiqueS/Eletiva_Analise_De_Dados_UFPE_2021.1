install.packages( "caret" )

library( caret )

seed_rng <- addTaskCallback( function( ... ) { set.seed( 123 ); TRUE } )

normal <- rnorm( 1000 )

sample( normal, 50, replace = TRUE )

set.seed( 412 )

Normal_Boots <- replicate( 10, sample( normal, 10, replace = TRUE ) )

Normal_Boots

media_boots <- replicate( 10, mean( sample( normal, 10, replace = TRUE ) ) )

media_boots

media_boots50 <- replicate( 50, mean( sample( normal, 10, replace = TRUE ) ) )

media_boots50

mediana_boots <- replicate( 10, median( sample( normal, 10, replace = TRUE ) ) )

mediana_boots

moda_boots <- replicate( 10, mode( sample( normal, 10, replace = TRUE ) ) )

moda_boots
