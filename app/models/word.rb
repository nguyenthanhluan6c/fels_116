class Word < ActiveRecord::Base
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :lessons, through: :results
  has_many :word_options, dependent: :destroy
  
  scope :learned, ->(user, category){joins(:lessons)
    .where(lessons: {user_id: user.id}, category_id: category.id)
    .distinct.where.not results: {word_option_id: nil}}
  scope :not_learn,->(user, category){where(category_id: category.id)
    .where.not id: Word.learned(user, category)}
  scope :all_words, -> (user, category) {where category_id: category.id}
end
