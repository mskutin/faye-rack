# Faye Rack Example using puma adapter

## Installation

```
clone
cd faye-rack
bundle install
```

## Usage, start server

```
cd faye-rack
puma
Open the file faye_client.html, and test using curl.
```

## Use curl commands to post from console:

```
curl -X POST http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/green", "data": "You said green", "ext": {"password": "..."}}'
curl -X POST http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/blue", "data": "You said blue", "ext": {"password": "..."}}'
```


## Deploy in weblogic
 - deploy in weblogic
 - change the url in faye_client.html file to point to the weblogic faye url
 - Test using the similar procedure
