class WebfingerProfile
  include FetchableXRD

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def public_key
    content_at('public-key')
  end

  def content_at(rel)
   if found_link = links.find{|x| x[rel] == rel}
      found_link['href']
   end
  end
end