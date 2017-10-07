class CheesyScaleService
  def get_total_results(content)
    key = "AIzaSyA5fgcdiQETqVww3Mb9lH6Endu_9XWyAyU"
    cse = "014532163075185725574:_hkfc83wdlk"
    uri = URI.parse("https://www.googleapis.com/customsearch/v1?key=#{key}&cx=#{cse}&q=\"#{content}\"")

    response = Net::HTTP.get_response(uri)
    hash = JSON.parse response.body
    hash["searchInformation"]["totalResults"].to_i
  end

  def define_cheesy_scale(number_of_records)
    # Method calculates 5 reference_values of total_search_results
    # They are spaced in asc. order at 10%, 30%, 50%, 70% and 90%
    reference_point_ids = (number_of_records/10).step(number_of_records, (number_of_records/5)).to_a
    reference_values = []
    reference_point_ids.each do |point|
     reference_values << Quote.order(:total_search_results)[point].total_search_results
    end
    reference_values
  end

  def assign_cheesy_score(quote, reference_values, highest_total_search_results)
    puts quote.inspect
    # Method that assigns a cheesy score from 0 to 5 according to cheesy_scale reference_values
    case quote[:total_search_results]
      when 0..reference_values[0] then quote[:cheesy_score] = 0
      when reference_values[0]..reference_values[1] then quote[:cheesy_score] = 1
      when reference_values[1]..reference_values[2] then quote[:cheesy_score] = 2
      when reference_values[2]..reference_values[3] then quote[:cheesy_score] = 3
      when reference_values[3]..reference_values[4] then quote[:cheesy_score] = 4
      when reference_values[4]..highest_total_search_results then quote[:cheesy_score] = 5
    end
    quote
  end

  def score_quotes_along_cheesiness_scale
    number_of_records_with_total_search_results = Quote.count(:total_search_results)
    highest_total_search_results = Quote.maximum(:total_search_results)

    reference_values = define_cheesy_scale(number_of_records_with_total_search_results)

    Quote.all.each do |quote|
      assign_cheesy_score(quote, reference_values, highest_total_search_results)
      quote.save
    end
  end
end
