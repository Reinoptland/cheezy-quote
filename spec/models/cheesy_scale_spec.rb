require 'rails_helper'

RSpec.describe CheesyScale, type: :model do
  it 'defines a cheesyscale' do
    results = 0
    11.times do
      create(:quote, total_search_results: results)
      results += 100
    end

    cheesy_scale = CheesyScale.new.define_scale

    expect(cheesy_scale.one_cheese).to be 100
    expect(cheesy_scale.two_cheeses).to be 300
    expect(cheesy_scale.three_cheeses).to be 500
    expect(cheesy_scale.four_cheeses).to be 700
    expect(cheesy_scale.five_cheeses).to be 900
    expect(cheesy_scale.total_search_results_highscore).to be 1000
  end
end
