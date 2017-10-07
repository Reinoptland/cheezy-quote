class CheesyScaleService
  def assign_cheesy_score(quote, cheesy_scale)
    # Method that assigns a cheesy score from 0 to 5 according to cheesy_scale

    case quote[:total_search_results]
      when 0..cheesy_scale.one_cheese
        then quote[:cheesy_score] = 0
      when cheesy_scale.one_cheese..cheesy_scale.two_cheeses
        then quote[:cheesy_score] = 1
      when cheesy_scale.two_cheeses..cheesy_scale.three_cheeses
        then quote[:cheesy_score] = 2
      when cheesy_scale.three_cheeses..cheesy_scale.four_cheeses
        then quote[:cheesy_score] = 3
      when cheesy_scale.four_cheeses..cheesy_scale.five_cheeses
        then quote[:cheesy_score] = 4
      when cheesy_scale.five_cheeses..cheesy_scale.total_search_results_highscore
        then quote[:cheesy_score] = 5
    end
    quote
  end

  def score_quotes_along_cheesy_scale
    cheesy_scale = CheesyScale.new.define_scale
    cheesy_scale.save
    all_quotes_with_total_search_results = Quote.where.not(total_search_results: [nil])

    all_quotes_with_total_search_results.each do |quote|
      assign_cheesy_score(quote, cheesy_scale)
      quote.save
    end
  end
end
