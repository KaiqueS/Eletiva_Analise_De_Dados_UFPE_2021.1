library( magrittr )
library( tidyverse )
library( poliscidata )
library( dplyr )

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

df <- iris[ c( 78, 121, 11, 92, 146, 62, 50, 17, 69, 143 ), ]

df %>% mutate( Sepal.Area = Sepal.Length * Sepal.Width )

df <- data.frame( c( "Eisenhower", "Kennedy", "Johnson", "Nixon", "Ford", "Carter", "Reagan", "Bush", "Clinton", "Bush", "Obama" ),
                  c( "1953-01-20", "1961-01-20", "1963-11-22", "1969-01-20", "1974-08-09",
                     "1977-01-20", "1981-01-20", "1989-01-20", "1993-01-20", "2001-01-20", "2009-01-20" ),
                  c( "1961-01-20", "1963-11-22", "1969-01-20", "1974-08-09", "1977-01-20",
                     "1981-01-20", "1989-01-20", "1993-01-20", "2001-01-20", "2009-01-20", "2017-01-20"),
                  c( "Republican", "Democratic", "Democratic", "Republican", "Republican", "Democratic",
                     "Republican", "Republican", "Democratic", "Republican", "Democratic") )

colnames( df ) <- c( "name", "start", "end", "party" )

df %>% mutate( party = case_when( party == "Republican" ~ "R",
                                  party == "Democratic" ~ "D" ) )

df <- poliscidata::nes

summary( df )

df_selec <- df %>% select( ftgr_cons, dem_raceeth, science_use, preknow3, obama_vote, income5, gender )

df_filtro <- df %>% filter( voted2012 == "Voted" )

count( df_filtro )

white <- df %>% transmute( cor = case_when( dem_raceeth == "1. White non-Hispanic" ~ "BRANCO",
                                            dem_raceeth != "1. White non-Hispanic" ~ "NAO_BRANCO" ) )

ideology <- df %>% transmute( ideologia = case_when( ftgr_cons < 34 ~ "Liberal",
                                                     ftgr_cons >= 34 && ftgr_cons <= 66 ~ "Centro",
                                                     ftgr_cons >= 67 ~ "Conservador" ) )

df_obama <- df %>% mutate( white = case_when( dem_raceeth == "1. White non-Hispanic" ~ "BRANCO",
                                              dem_raceeth != "1. White non-Hispanic" ~ "NAO_BRANCO" ) ) %>%
  mutate( ideology = case_when( ftgr_cons < 34 ~ "Liberal",
                                ftgr_cons >= 34 && ftgr_cons <= 66 ~ "Centro",
                                ftgr_cons >= 67 ~ "Conservador" ) ) %>%
  transmute( obama_vote = case_when( obama_vote == 0 ~ "Nao",
                                     obama_vote == 1 ~ "Sim" ) )

df_novo_filtro <- df_filtro

df_novo_filtro$ftgr_cons <- as.numeric( df_filtro$ftgr_cons )

df_novo_filtro %>% group_by( science_use ) %>%
                   summarise( mean( ftgr_cons, na.rm = TRUE ) )
