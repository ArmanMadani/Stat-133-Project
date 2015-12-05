library(XML)

# Data Frame of NBA Champions
url.champs <- 'https://www.ticketcity.com/nba/nba-finals-tickets/nba-finals-champions.html'
download.file(url, '~/Desktop/Stat 133 Project/Raw Data/champions.html')
nba.champions <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/champions.html')
nba.champions <- as.data.frame(nba.champions[[2]])
nba.champions[] <- lapply(nba.champions, as.character)
colnames(nba.champions) <- nba.champions[1, ]
nba.champions <- nba.champions[-1, ]
## Cut this down to champions from 1995 - 2015

# List of 'Top Ten' Draft Picks 
# 1995
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 1996
url.draft.1996 <- 'http://www.nbadraft.net/nba_draft_history/1996.html'
download.file(url.draft.1996, '~/Desktop/Stat 133 Project/Raw Data/1996draft.html')
draft.1996 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1996draft.html')
draft.1996 <- as.data.frame(draft.1996[[1]])
draft.1996[] <- lapply(draft.1996, as.character)
colnames(draft.1996) <- draft.1996[1, ]
draft.1996 <- draft.1996[-1, ]
draft.1996 <- head(draft.1996, 10)
# 1997
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 1998
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 1999
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2000
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2001
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2002
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2003
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2004
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2005
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2006
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2007
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2008
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2009
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2010
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2011
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2012
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2013
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2014
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)
# 2015
url.draft.1995 <- 'http://www.nbadraft.net/nba_draft_history/1995.html'
download.file(url.draft.1995, '~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- readHTMLTable('~/Desktop/Stat 133 Project/Raw Data/1995draft.html')
draft.1995 <- as.data.frame(draft.1995[[1]])
draft.1995[] <- lapply(draft.1995, as.character)
colnames(draft.1995) <- draft.1995[1, ]
draft.1995 <- draft.1995[-1, ]
draft.1995 <- head(draft.1995, 10)