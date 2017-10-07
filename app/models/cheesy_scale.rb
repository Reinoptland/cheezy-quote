class CheesyScale < ApplicationRecord
  def define_scale
    # A Cheesy scale is 5 reference values of total_search_results bases on all records
    # These reference values are spaced in asc. order at 10%, 30%, 50%, 70% and 90%
    number_of_records_with_tsr = Quote.count(:total_search_results)
    highest_total_search_results = Quote.maximum(:total_search_results)

    reference_value_ids = (number_of_records_with_tsr/10)
    .step(number_of_records_with_tsr, (number_of_records_with_tsr/5))
    .to_a

    reference_values = []
    reference_value_ids[0..4].each do |point|
     reference_values << Quote.order(:total_search_results)[point].total_search_results
    end

    self.one_cheese = reference_values[0]
    self.two_cheeses = reference_values[1]
    self.three_cheeses = reference_values[2]
    self.four_cheeses = reference_values[3]
    self.five_cheeses = reference_values[4]
    self.total_search_results_highscore = highest_total_search_results
    self
  end
end
