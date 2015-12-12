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
download.file(url.champs, "rawdata/champions.html")

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

# Download data for Case Study Players


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

suppressWarnings(source("code/data_cleanprep.R"))

