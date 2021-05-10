library( rvest )
library( XML )
library( dplyr )

url <- "https://en.wikipedia.org/wiki/List_of_Nobel_laureates"

exemplo <- read_html( url )

tabelas <- url %>% read_html %>% html_nodes( "table" )

data_frame <- as.data.frame( html_table( tabelas[ 1 ] ) )

data_frame
