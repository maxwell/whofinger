class HttpClient
  def self.get(url)
    connection.get(url).body
  end

  def self.connection
    Faraday.new '',  {} do |c|
      c.use FaradayMiddleware::FollowRedirects, :limit => 3
      c.use Faraday::Adapter::NetHttp
    end
  end
end