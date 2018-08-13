files=setwd("C:/Users/Krishnan/Desktop/textmining")
filelist=list.files(path=files)

lapply(filelist,FUN=readLines)

a=lapply(filelist,FUN=readLines)

lapply(a,FUN=paste,collapse=" ")

corpus=lapply(a,FUN = paste,collapse=" ")

#To do sentiment analysis on the documents
corpus

#To load the positive lexicons into the R envirnorment
positive_lexicon=read.table("positive.txt")
positive_lexicon

#To scan the number of entries in the list
pos_lex=scan("positive.txt",what='character',comment.char = ';')

#To load the negative lexicons into the R envirnorment
negative_lexicon=read.table("negative.txt")
negative_lexicon

#To scan the number of entries in the list
neg_lex=scan("negative.txt",what='character',comment.char = ';')

#To split the corpus into bag of words
bag=str_split(corpus2,pattern = "\\s+")
bag

#To match and compare postive words in lexicon with the document and to get the score
lapply(bag, function(x){sum(!is.na(match(x,pos_lex)))})

#To match and compare postive words in lexicon with the document and to get the score
lapply(bag, function(x){sum(!is.na(match(x,neg_lex)))})


#To calculate the final score for each document
lapply(bag, function(x){sum(!is.na(match(x,pos_lex)))- sum(!is.na(match(x,neg_lex)))})

#To unlist the scores we got
score=unlist(lapply(bag, function(x){sum(!is.na(match(x,pos_lex)))- sum(!is.na(match(x,neg_lex)))}))
score

#To calculate the mean of the score
mean(score)

#To calculate the Standard Deviation of the score
sd(score)

#To plot the histograms for the score
hist(score)

##As we got the score as (-3),(0) and (-5) for the documents 1,2,3 respectively so here by we can conclude
#that documents 1&3 have negative sentiment and the document is neutral