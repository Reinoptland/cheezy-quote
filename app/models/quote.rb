class Quote < ApplicationRecord
  validates_presence_of :source, :content
end
