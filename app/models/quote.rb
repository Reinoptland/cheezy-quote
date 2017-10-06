class Quote < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :source, :content

  def self.random
    Quote.order("RANDOM()").limit(10)[0]
  end
end
