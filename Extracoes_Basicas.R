install.packages( 'XML' )
install.packages( 'rjson' )
install.packages( 'readxl' )

library( readxl )
library( rjson )
library( XML )
library( rvest )
library( dplyr )

###

wikipedia_csv_url <- "https://pt.wikipedia.org/wiki/Comma-separated_values"

csvTables <- wikipedia_csv_url %>% read_html %>% html_nodes( "table" )

csvLinks <- wikipedia_csv_url %>% read_html %>% html_nodes( "link" )

wikipedia_csv <- as.data.frame( html_table( csvTables ) )

###

wikipedia_txt_url <- "https://pt.wikipedia.org/wiki/Arquivo_de_texto"

wikipedia_txt <- read_html( wikipedia_txt_url )

wikipedia_txt <- wikipedia_txt %>% html_nodes( "p" ) %>% html_text( )

txtLinks <- wikipedia_txt_url %>% read_html %>% html_nodes( "link" )

###

wikipedia_excel_url <- "https://pt.wikipedia.org/wiki/Microsoft_Excel"

wikipedia_excel <- read_html( wikipedia_txt_url )

wikipedia_excel <- wikipedia_excel %>% html_nodes( "ul" )

###

Sigmod_xml <- xmlToDataFrame( "http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/sigmod-record/SigmodRecord.xml" )
