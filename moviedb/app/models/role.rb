class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
  
  validates :actor, presence: true
  validates :movie, presence: true
  validates :name, presence: true
end
