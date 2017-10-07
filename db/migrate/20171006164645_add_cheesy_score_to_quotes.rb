class AddCheesyScoreToQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :total_search_results, :integer
    add_column :quotes, :cheesy_score, :integer
  end
end
