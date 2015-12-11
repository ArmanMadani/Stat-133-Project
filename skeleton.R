## File for Initializing Project ##

# Initialize subdirectories
dir.create("code")
dir.create("data")
dir.create("images")
dir.create("rawdata")
dir.create("report")
dir.create("resources")

# Download data for champions
url.champs <- 
  'https://www.ticketcity.com/nba/nba-finals-tickets/nba-finals-champions.html'
download.file(url.champs, "rawdata/Champions.html")

# Download data for drafted player heights
for (i in 1995:2015) {
  url.p_height <- 
    paste0('http://www.draftexpress.com/nba-draft-history/?syear=', i)
  download.file(url.p_height, paste0('rawdata/player_heights', i, '.html'))
}
