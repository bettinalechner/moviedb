class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles
    
    validates :title, presence: true, length: { minimum: 2 }
    validates :year, presence: true, numericality: { only_integers: true, greater_than: 1800, less_than: Date.today.year + 2.years }
    validates :rating, presence: true, numericality: { only_integers: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    validates :description, presence: true, length: { minimum: 5 }
    
end
