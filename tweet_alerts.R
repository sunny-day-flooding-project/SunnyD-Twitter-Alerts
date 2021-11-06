library(rtweet)
library(googledrive)

googledrive::drive_auth(path = Sys.getenv("GOOGLE_JSON_KEY"))

twitter_token_id <- googledrive::drive_get(shared_drive = as_id(Sys.getenv("GOOGLE_SHARED_DRIVE_ID")), path = "twitter_token.rds")

tmp_file_path <- tempfile(fileext = ".rds")

twitter_token_file <- googledrive::drive_download(twitter_token_id, path = tmp_file_path)

print(twitter_token_file)

Sys.setenv("TWITTER_PAT"= tmp_file_path)

run = T

while(run ==T){
  start_time <- Sys.time()
  print(start_time)

  rtweet::get_token()
  my_timeline <- rtweet::get_my_timeline(token = twitter_token)
  print(my_timeline)

  # Wait to make the delay 6 minutes
  delay <- difftime(Sys.time(),start_time, units = "secs")
  
  Sys.sleep((60*6) - delay)
}

