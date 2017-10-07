require 'rails_helper'

RSpec.describe ScoreAlongCheesyScaleJob, type: :job do
  it 'performs requests for total search results' do
    quote = create(:quote, total_search_results: nil)
    create(:cheesy_scale)

    ScoreAlongCheesyScaleJob.perform_now(quote)
    quote.reload

    expect(quote.total_search_results.class).to be Integer
    expect(quote.total_search_results).to be >= 1
    expect(quote.cheesy_score.class).to be Integer
    expect(quote.cheesy_score).to be >= 0
  end
end
