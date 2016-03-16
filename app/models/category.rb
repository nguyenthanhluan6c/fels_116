class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  def number_of_learned_word user
    Word.learned(user, self).count    
  end
end
