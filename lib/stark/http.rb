require 'stark'
require 'net/http'
require 'uri'
require 'thrift'

class Stark::HTTP
  VERSION = '1.0.0'
  HTTP_USER_AGENT = "#{self.name} #{VERSION} - Ruby #{RUBY_VERSION}"

  class ClientTransport < Thrift::BaseTransport
    def initialize(url)
      @url = URI url
      @headers = {'Content-Type' => 'application/x-thrift', 
                  'User-Agent'   => Stark::HTTP::HTTP_USER_AGENT }
      @outbuf = ""

      @http = Net::HTTP.new @url.host, @url.port
      @http.use_ssl = @url.scheme == "https"
      if $DEBUG
        @http.set_debug_output $stderr
      end
    end

    def open?; true end
    def read(sz); @inbuf.read sz end
    def write(buf); @outbuf << buf end

    def add_headers(headers)
      @headers = @headers.merge(headers)
    end

    RETRY_ATTEMPTS = 10

    def flush
      attempts = 0

      @http.start unless @http.started?

      begin
        resp = @http.post(@url.request_uri, @outbuf, @headers)
        attempts = 0
      rescue StandardError => e
        @http.finish
        
        raise e if attempts > RETRY_ATTEMPTS

        attempts += 1

        @http.start

        retry
      end

      @inbuf = StringIO.new resp.body
      @outbuf = ""
    end
  end

  def self.open(url, interface)
    trans = ClientTransport.new(url)
    proto = Thrift::BinaryProtocolFactory.new.get_protocol trans
    interface.new proto, proto
  end
end
