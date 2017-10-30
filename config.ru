require 'faye'
require 'logger'

Faye::WebSocket.load_adapter 'puma'
app = Faye::RackAdapter.new(:mount => '/ws', :timeout => 5)

log = Logger.new(STDOUT)
log.level = Logger::DEBUG

app.on(:handshake) do |client_id|
    log.debug("[handshake] - client: '#{client_id}'")
end

app.on(:subscribe) do |client_id, channel|
    log.debug("[subscribe] - client: '#{client_id}', channel: '#{channel}'")
end

app.on(:unsubscribe) do |client_id, channel|
    log.debug("[unsubscribe] - client: '#{client_id}', channel: '#{channel}'")
end

app.on(:publish) do |client_id, channel, data|
    log.debug("[publish] - client: '#{client_id}', channel: '#{channel}', data: '#{data.inspect}'")
end

run app
