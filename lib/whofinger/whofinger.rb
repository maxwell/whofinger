class Whofinger
  attr_accessor :account, :ssl, :host_meta, :webfinger_profile

  def initialize(account)
    self.account = account
    self.ssl = true
  end

  #everything below should be private I guess
  def account=(str)
    @account = str.strip.gsub('acct:','').to_s.downcase
  end

  def fetch
    @host_meta = try_host_meta_on_ssl_and_then_non_ssl
    @webfinger_profile = WebfingerProfile.new(@host_meta.webfinger_profile_url).fetch
    self
  end


    #this tries the xrl url with https first, then falls back to http
  def try_host_meta_on_ssl_and_then_non_ssl
    begin
      HostMeta.new(account, self.ssl).fetch
    rescue => e
      if self.ssl
        self.ssl = false
        retry
      else
        raise e
        nil
      end
    end
  end
end