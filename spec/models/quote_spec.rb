require 'rails_helper'

RSpec.describe Quote, type: :model do
  it 'returns random quotes' do
    create_list :quote, 100
    random_quotes = []
    2.times do
      random_quotes << Quote.random
    end

    expect(random_quotes[0]).not_to be(random_quotes[1])
  end

  it 'requests the totalresults from a google search' do
    skip "For the google search quota"
    quote = create :quote
    quote.inspect

    quote.get_total_results

    expect(quote.total_search_results).to be_an(Integer)
  end
end
