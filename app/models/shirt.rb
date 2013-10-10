class Shirt < ActiveRecord::Base
  validates_presence_of :name, :description
  def self.search_for(query)
    where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
