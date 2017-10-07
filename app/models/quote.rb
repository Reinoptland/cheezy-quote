class Quote < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :source, :content

  def self.random
    Quote.order("RANDOM()").limit(10)[0]
  end

  def self.display_not_found
    Quote.new({content: 'We didn\'t find anything, sorry!', source: 'Cheesyquote'})
  end

  def get_total_results
    key = ENV['GOOGLE_API_KEY']
    cse = ENV['GOOGLE_CUSTOM_SEARCH_ENGINE_KEY']
    content = self.content

    uri = URI.parse("https://www.googleapis.com/customsearch/v1?key=#{key}&cx=#{cse}&q=\"#{content}\"")

    response = Net::HTTP.get_response(uri)
    hash = JSON.parse response.body
    self.total_search_results = hash["searchInformation"]["totalResults"].to_i
  end
end

Quote.import
