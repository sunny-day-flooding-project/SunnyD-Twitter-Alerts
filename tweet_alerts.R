run = T

while(run ==T){
  start_time <- Sys.time()
  print(start_time)
  
  
  twitter_token <- readRDS(Sys.getenv("TWITTER_TOKEN"))
  my_timeline <- rtweet::get_my_timeline(token = twitter_token)
  print(my_timeline)

  # Wait to make the delay 6 minutes
  delay <- difftime(Sys.time(),start_time, units = "secs")
  
  Sys.sleep((60*6) - delay)
}

