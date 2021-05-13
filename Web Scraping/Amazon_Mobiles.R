library(xml2)
library(rvest)
library(dplyr)
data = data.frame()
for(page_no in seq(from = 1, to = 3 , by =1))
{
  link =paste0("https://www.amazon.in/s?k=mobile&i=electronics&rh=n%3A1389432031%2Cn%3A1805560031&s=relevancerank&dc&page=",page_no,"&qid=1620884261&rnid=3576079031&ref=sr_pg_",page_no)
  page = read_html(link)
  names = page %>% html_nodes(".a-spacing-none.s-line-clamp-2") %>% html_text()
  prices = page %>% html_nodes(".a-price-whole") %>% html_text()
  prices=as.numeric(sub(",","",prices))
  data = rbind(data, data.frame(names,prices, stringsAsFactors = FALSE))
}
data[is.na(data)]=0
write.csv(data, "Mobiles_Amazon.csv")
