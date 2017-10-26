# Faye Rack Example using puma adapter

## Installation

```
clone
cd sinatra-faye-example
bundle install
```

## Usage, start server

```
cd sinatra-faye-example
puma
```

## Open the file faye_client.html, and test using curl.

## Use curl commands to post from console:

```
curl -X POST http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/green", "data": "You said green", "ext": {"password": "..."}}'
curl -X POST http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/blue", "data": "You said blue", "ext": {"password": "..."}}'
```
