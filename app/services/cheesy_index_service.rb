class CheesyIndexService
  def get_total_requests(content)
    key = "AIzaSyA5fgcdiQETqVww3Mb9lH6Endu_9XWyAyU"
    cse = "014532163075185725574:_hkfc83wdlk"
    uri = URI.parse("https://www.googleapis.com/customsearch/v1?key=#{key}&cx=#{cse}&q=#{content}")

    response = Net::HTTP.get_response(uri)
    hash = JSON.parse response.body
    hash["searchInformation"]["totalResults"].to_i
  end
end
