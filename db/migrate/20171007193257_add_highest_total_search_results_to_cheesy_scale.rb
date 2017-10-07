class AddHighestTotalSearchResultsToCheesyScale < ActiveRecord::Migration[5.1]
  def change
    add_column :cheesy_scales, :total_search_results_highscore, :integer
  end
end
