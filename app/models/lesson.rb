class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :activities
  has_many :words, through: :results
  has_many :results

  def build_lesson_results    
    number = category.number_of_words_in_lesson    
    words = category.words.order("RANDOM()").limit number
    words.each do |word|
      result = results.create word: word      
      end     
  end
end
