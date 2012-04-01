module FetchableXRD
  def fetch
    @body = HttpClient.get(url)
    self
  end

  def doc
    @doc ||= Nokogiri::XML::Document.parse(@body)
  end

  #returns array of link hashs, i guess?
  def links
    @links ||= lambda do 
                raw_links.map do |link|
                  hash = {}
                  link.keys.each do |key|
                    hash[key] = link[key]
                  end
                  hash
                end
              end.call
  end


  def raw_links
    @raw_links ||= doc.xpath('//xmlns:Link')
  end
end