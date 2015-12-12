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
  url_p_height <- 
    paste0('http://www.draftexpress.com/nba-draft-history/?syear=', i)
  download.file(url_p_height, paste0('rawdata/player_heights', i, '.html'))
}

# Download data for champions' season stats
for (i in 1996:2015) {
  url_championship_stats <- 
    paste0('http://www.basketball-reference.com/leagues/NBA_', i, '.html')
  download.file(url_championship_stats, paste0('rawdata/championship_stats', i, '.html'))
}

# Download data for Case Study Player: Stephen Curry
url_steph_curry <- 
  'http://www.draftexpress.com/profile/Stephen-Curry-1170/'
download.file(url_steph_curry, 'rawdata/steph_curry.html')
url_steph_curry_career <- 
  'http://www.basketball-reference.com/players/c/curryst01.html'
download.file(url_steph_curry_career, 'rawdata/steph_curry_career.html')

# Download data for Case Study Player: Draymond Green
url_draymond_green <- 
  'http://www.draftexpress.com/profile/Draymond-Green-5859/'
download.file(url_draymond_green, 'rawdata/draymond_green.html')
url_draymond_green_career <- 
  'http://www.basketball-reference.com/players/g/greendr01.html'
download.file(url_draymond_green_career, 'rawdata/draymond_green_career.html')

# Download data for Case Study Player: Tim Duncan
url_tim_duncan <-
  'http://www.draftexpress.com/profile/Tim-Duncan-2292/'
download.file(url_tim_duncan, 'rawdata/tim_duncan.html')
url_tim_duncan_career <-
  'http://www.basketball-reference.com/players/d/duncati01.html'
download.file(url_tim_duncan_career, 'rawdata/tim_duncan_career.html')

# Download data for Case Study Player: Shaq
url_shaq <-
  'http://www.draftexpress.com/profile/Shaquille-O-neal-3796/'
download.file(url_shaq, 'rawdata/shaq.html')
url_shaq_career <-
  'http://www.basketball-reference.com/players/o/onealsh01.html'
download.file(url_shaq_career, 'rawdata/shaq_career.html')

# Download data for Championship team lineups
url_champ_stats <- 'http://www.basketball-reference.com/teams/HOU/1995.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 1995, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/CHI/1996.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 1996, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/CHI/1997.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 1997, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/CHI/1998.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 1998, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/SAS/1999.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 1999, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/LAL/2000.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2000, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/LAL/2001.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2001, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/LAL/2002.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2002, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/SAS/2003.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2003, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/DET/2004.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2004, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/SAS/2005.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2005, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/MIA/2006.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2006, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/SAS/2007.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2007, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/BOS/2008.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2008, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/LAL/2009.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2009, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/LAL/2010.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2010, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/DAL/2011.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2011, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/MIA/2012.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2012, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/MIA/2013.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2013, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/SAS/2014.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2014, '.html'))
url_champ_stats <- 'http://www.basketball-reference.com/teams/GSW/2015.html'
download.file(url_champ_stats, paste0('rawdata/champion_stats', 2015, '.html'))

