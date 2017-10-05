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
end
