class WebsocketOrdersController < WebsocketRails::BaseController
  
    #"order_receive" accepts message from the client event and broadcast it to client with "websocket_order"
    def orders_receive
      receive_orders = orders()
      broadcast_orders(:websocket_orders, receive_orders)
    end
end
