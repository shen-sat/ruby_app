# Ruby App

An app that sorts and displays logs for page views.

# Running

`>ruby lib/run_app.rb logs/webserver.log`

# Testing

`rspec`

# Assumptions

 - .log file is a series of logs, each on a seperate line
 - logs are in the format of '[page] [address]'
 - .log files will be processed one at a time

# Design

I've used Ruby for this app. I've used objects to represent the app, input validator and page aggregator. The objects and their structure were formed using test-driven development (TTD). The input validator ensures input adheres to the assumptions listen above. The page aggregator takes in an array of logs and sorts them into two lists: one for page views and one for unique page views (based on IP address). The app runs the input validator and page aggregator and sorts and displays the results.

The app runs and returns output for the supplied webserver.log file. 

