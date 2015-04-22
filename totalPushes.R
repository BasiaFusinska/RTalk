pushEvents <- readEvents(file, "PushEvent")

repositoryUrls <- lapply(pushEvents, function(x) {
  c("id"=x$repo$id, 
    "url"=x$repo$url)
})

pushesDataFrame <- data.frame(do.call(rbind, repositoryUrls))

languagesFile <- "Data/2015-01-01-15_languages.csv"
ids <- read.csv(file=languagesFile,sep=",",head=TRUE)
ids$X <- NULL

pushesDataFrame$language <- NULL
pushesDataFrame$language <- apply(pushesDataFrame, 1, function(row){
  language = ids[as.character(ids$id) == as.character(row[1]), ]$language
   #              && as.character(ids$url) == as.character(row[2]),]$language
  #because some ids have many hits
  as.character(language[1])
})

languages <- table(pushesDataFrame$language)
sortedLanguages <- sort(languages[languages > 5], decreasing=TRUE)

barplot(sortedLanguages)

