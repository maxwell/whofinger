class HostMeta
  include FetchableXRD
  attr_accessor :ssl

  def initialize(account, ssl)
    @account = account
    @ssl = ssl
  end

  def url
    domain = @account.split('@')[1]
    "http#{'s' if @ssl}://#{domain}/.well-known/host-meta"
  end

  def webfinger_profile_url
    return nil unless namespace_matches_xrd_spec
    webfinger_profile_location 
  end

  def namespace_matches_xrd_spec
    doc.namespaces["xmlns"] == "http://docs.oasis-open.org/ns/xri/xrd-1.0"
  end

  def webfinger_profile_location
    parsed_webfinger_template.gsub('{uri}', @account)
  end

  def parsed_webfinger_template
    doc.at('Link[rel=lrdd]').attribute('template').value
  end
end