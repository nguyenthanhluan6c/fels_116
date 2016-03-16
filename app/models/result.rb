class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_option

  scope :answered, ->{where.not word_option_id: nil}
  scope :unanswered, ->{where word_option_id: nil}
  scope :correct_results, ->{joins(:word_option).where word_options: {is_correct: true}}
end
