class WebfingerProfile
  include FetchableXRD

  def initialize(url)
    @url = url
  end
end