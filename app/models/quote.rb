class Quote < ApplicationRecord
  validates_presence_of :source, :content

  def self.random
    Quote.order("RANDOM()").limit(10)[0]
  end
end
