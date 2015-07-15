str_tokenizer = function(){
        file_input = readLines(file.choose(), n = 5000)
        corpus_text = VectorSource(file_input)
        corpus = Corpus(corpus_text)
        corpus <- tm_map(corpus, content_transformer(tolower))
        corpus <- tm_map(corpus, removePunctuation)
        
        corpus <- tm_map(corpus, stripWhitespace)
        corpus = tm_map(corpus, content_transformer(remove_special))
        dtm <- DocumentTermMatrix(corpus)
        head(dtm$dimnames$Terms, n = 100)
        dtm2 <- as.matrix(dtm)
        
        freq <- colSums(as.matrix(dtm))
        frequency <- sort(freq, decreasing=TRUE) 
        return (frequency)
}
remove_special = function(x){
        x = gsub("[^A-Za-z ]", "", x)
}
setwd("C:/Users/eladio/Documents/GitHub/DataScienceCapstone")
freq = str_tokenizer()



con <- file("en_US.twitter.txt", "r")
readLines(con, 1)
close(con)


