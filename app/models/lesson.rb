class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :activities
  has_many :words
  has_one :result
end
