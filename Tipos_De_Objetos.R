install.packages( "magrittr" )
install.packages( "tidyverse" )
install.packages( "poliscidata" )

library( magrittr )
library( tidyverse )
library( poliscidata )

df <- data.frame( c( "A", "A", "B", "B" ), c( 5, 3, 8, 12 ) )

colnames( df ) <- c( "x", "y" )

df %>%  summarise( z = mean( y ) )

df <- data.frame( c( 8.04, 6.95, 7.58 ), 
                  c( 9.14, 8.14, 8.74 ), 
                  c( 7.46, 6.77, 12.74 ), 
                  c( 6.58, 5.76, 7.71 ) )

colnames( df ) <- c( "y1", "y2", "y3", "y4" )

df %>% select( "y1" )

df <- data.frame( c( 1, 6, 2, 4 ), c( 10, 8, 3, 5 ) )

colnames( df ) <- c( "x", "y " )

df %>% mutate( z = df$x - df$y )

df <- data.frame( c( "Boston", "Boston", "NYC", "NYC" ),
                  c( 220, 125, 150, 250 ) )

colnames( df ) <- c( "city", "sales" )

df %>% group_by( city ) %>%
  summarise( avg_sales = mean( sales ) )

df <- data.frame( c( 3, 2, 1, 4 ),
                  c( 55, 52, 60, 65 ),
                  c( 60, 56, 63, 67 ) )

colnames( df ) <- c( "week", "min", "max" )

df %>% arrange( df )

df <- data.frame( c( "A", "A", "B", "B" ),
                  c( 2, 4, 6, 8 ),
                  c( "W1", "W2", "W1", "W2" ),
                  c( 25, 21, 26, 30 ) )

colnames( df ) <- c( "x_b_1", "x_b_2", "y_c_1", "y_c_2")

df %>% select( c( 3:4 ) )
