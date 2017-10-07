require 'rails_helper'

RSpec.describe CheesyScaleService, type: :service do
  it 'assigns a value on the cheesy_scale to a quote according to its total_search_result' do
    cheesy_scale = create(:cheesy_scale)
    quote = create(:quote, total_search_results: 600, cheesy_score: nil)

    CheesyScaleService.new
    .assign_cheesy_score(quote, cheesy_scale)

    expect(quote.cheesy_score).to be 3
  end

  it 'scores all quotes along the cheesiness scale' do
    results = 0
    10.times do
      create(:quote, total_search_results: results)
      results += 100
    end

    CheesyScaleService.new.score_quotes_along_cheesy_scale

    Quote.all.each do |quote|
      expect(quote.cheesy_score).to be_an(Integer)
      expect(quote.cheesy_score).to be <= 5
    end
  end

  it 'does not score quotes that have no total_search_results' do
    create(:quote, total_search_results: nil, cheesy_score: nil)
    results = 0
    10.times do
      create(:quote, total_search_results: results)
      results += 100
    end

    CheesyScaleService.new.score_quotes_along_cheesy_scale

    quote_without_total_search_results = Quote.where(total_search_results: nil).first
    expect(quote_without_total_search_results.cheesy_score).to be nil
  end
end
