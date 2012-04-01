class WebfingerProfile
  include FetchableXRD
  
  attr_accessor :url

  def initialize(url)
    @url = url
  end
end