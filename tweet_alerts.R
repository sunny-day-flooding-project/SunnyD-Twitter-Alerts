run = T

while(run ==T){
  start_time <- Sys.time()
  print(start_time)
  
  token <- Sys.getenv("TWITTER_TOKEN")
  
  twitter_token <- readRDS(token)
  
  my_timeline <- rtweet::get_my_timeline(token = twitter_token)
  print(my_timeline)

  # Wait to make the delay 6 minutes
  delay <- difftime(Sys.time(),start_time, units = "secs")
  
  Sys.sleep((60*6) - delay)
}

