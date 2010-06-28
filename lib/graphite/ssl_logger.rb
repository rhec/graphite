require 'openssl'

module Graphite
  class SslLogger < Logger

    def initialize(server_host, logger = nil, cert = nil, key = nil)
      super(server_host, logger)
      @cert = cert
      @key = key
    end
        
    def socket
      if @socket.nil? || @socket.closed?
        plain_socket = super()
        ssl_context = OpenSSL::SSL::SSLContext.new()
        if @cert && @key
          ssl_context.cert = OpenSSL::X509::Certificate.new(@cert)
          ssl_context.key = OpenSSL::PKey::RSA.new(@key)
        end
        @socket = OpenSSL::SSL::SSLSocket.new(plain_socket, ssl_context)
        @socket.sync_close = true
        @socket.connect
      end
      @socket
    end
    
  end
end
