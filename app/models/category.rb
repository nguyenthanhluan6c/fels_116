class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates_numericality_of :number_of_words_in_lesson, greater_than: 0
  validates_presence_of :name

  accepts_nested_attributes_for :words, allow_destroy: true

  def number_of_learned_word user
    Word.learned(user, self).count    
  end
end
