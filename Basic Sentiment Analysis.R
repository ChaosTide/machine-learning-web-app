# Load necessary libraries
library(syuzhet)
library(ggplot2)
li
# Convert comments to UTF-8 format
ai_comments <- iconv(ai_data$Comment, to = 'utf-8-mac')
ev_comments <- iconv(ev_data$Comment, to = 'utf-8-mac')

# Perform sentiment analysis
ai_sentiments <- get_nrc_sentiment(ai_comments)
ev_sentiments <- get_nrc_sentiment(ev_comments)

# Plot sentiment analysis for AI comments
barplot(colSums(ai_sentiments),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment Analysis for Generative AI')

# Plot sentiment analysis for EV comments
barplot(colSums(ev_sentiments),
        las = 2,
        col = rainbow(10),
        ylab = 'Count',
        main = 'Sentiment Analysis for Electric Vehicles')

