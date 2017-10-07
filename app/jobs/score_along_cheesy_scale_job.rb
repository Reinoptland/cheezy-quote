class ScoreAlongCheesyScaleJob < ApplicationJob
  queue_as :default

  def perform(quote)
    quote.get_total_results
    CheesyScaleService.new.assign_cheesy_score(quote, CheesyScale.order("created_at").last)
    quote.save
  end
end
