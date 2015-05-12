urls = urlsDataFrame

urls$language <- apply(urls, 1, function(row){
  language = googleData[as.character(googleData$url) == as.character(row[2]), ]$repository_language
  
  as.character(language[1])
})

head(urls)

languages <- table(urls$language)
languages <- sort(languages, decreasing=TRUE)
barplot(languages)

languages <- table(urls[as.character(urls$language) != "null",]$language)
languages <- sort(languages[languages > 50], decreasing=TRUE)
barplot(languages)

