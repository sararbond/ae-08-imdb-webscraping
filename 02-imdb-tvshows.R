## Scrape the list of most populat TV shows from https://www.imdb.com/chart/tvmeter

# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# read in http://www.imdb.com/chart/tvmeter ------------------------------------

page <- read_html('http://www.imdb.com/chart/tvmeter')

# years ------------------------------------------------------------------------

years <- page %>%
  html_nodes("a+.secondaryInfo") %>%
  html_text() %>%
  str_remove("\\(") %>% 
  str_remove("\\)") %>% 
  as.numeric()
# scores -----------------------------------------------------------------------

scores <- page %>%
  html_nodes(".imdbRating") %>% 
  html_text() %>% 
  as.numeric()

# names ------------------------------------------------------------------------

names <- page %>% 
  html_nodes(".titleColumn a") %>% 
  html_text()

# tvshows dataframe ------------------------------------------------------------

tvshows <- tibble(
  rank = 1:100,
  title = names,
  year = years,
  score = scores
)

# add new variables ------------------------------------------------------------

tvshows <- tvshows %>%
  mutate(
    genre = NA,
    runtime = NA,
    n_episode = NA,
  )

# add new info for first show --------------------------------------------------

tvshows$genre[1] <- "__"
tvshows$runtime[1] <- ___
tvshows$n_episode[1] <- ___

# add new info for second show --------------------------------------------------

tvshows$genre[2] <- "__"
tvshows$runtime[2] <- ___
tvshows$n_episode[2] <- ___

# add new info for third show --------------------------------------------------

tvshows$genre[3] <- "__"
tvshows$runtime[3] <- ___
tvshows$n_episode[3] <- ___
