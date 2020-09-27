# SPSolution
|Technology|Version|
|----------|-------|
|Ruby      |2.7.1  |
|RSpec     |3.9.0  |
## Setup
Install dependencies:
```
bundle
```

## Rake tasks
### log:stats
This Rake task outputs list of arrays containing path and count of occurences in provided log file.

To run task:
```
rake 'log:stats[webserver.log]'
```
### log:stats:unique_ips
This Rake task outputs list of arrays containing path and count of unique IP occurences in provided log file.

To run task:
```
rake 'log:stats:unique_ips[webserver.log]'
```

## Specs

To run specs:
```
bundle exec rspec
```
