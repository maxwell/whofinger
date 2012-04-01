class WebfingerProfile
  include FetchableXRD

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def public_key
    content_at('public-key').to_s.strip
  end

  def content_at(rel_value)
   if found_link = links.find{|x| x['rel'] == rel_value}
      found_link['href']
   end
  end
end