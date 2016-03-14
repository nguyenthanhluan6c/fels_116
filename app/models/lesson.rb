class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :activities
  has_many :words, through: :results
  has_many :results

  accepts_nested_attributes_for :results

  enum status: {new_lesson: 0, done_lesson: 1}
  
  def build_lesson_results    
    number = category.number_of_words_in_lesson    
    words = category.words.order("RANDOM()").limit number
    words.each do |word|
      result = results.create word: word      
      end     
  end
end
