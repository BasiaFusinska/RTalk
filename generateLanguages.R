toSave <- urlsDataFrame
summary(toSave)

toSave$language <- ""
toSave$language <- lapply(toSave, function(x) {
  lIndex <- sample(1:10, 1)
  switch(lIndex,
         "1" = "Python",
         "2" = "JavaScript",
         "3" = "Ruby",
         "4" = "PHP",
         "5" = "Java",
         "6" = "C++",
         "7" = "CSS",
         "8" = "C#",
         "9" = "C",
         "10" = "Go")
})

ts <- data.frame(lapply(toSave, as.character), stringsAsFactors=FALSE)

write.csv(ts, file="Data/2015-01-01-15_languages.csv")
