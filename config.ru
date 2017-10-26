require 'faye'

Faye::WebSocket.load_adapter 'puma'
app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
run app
