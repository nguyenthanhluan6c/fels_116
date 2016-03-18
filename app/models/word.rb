class Word < ActiveRecord::Base
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :lessons, through: :results
  has_many :word_options, dependent: :destroy

  accepts_nested_attributes_for :word_options, allow_destroy: true

  validates_presence_of :name
  validate :at_least_one_right_word_option

  scope :learned, ->(user, category){joins(:lessons)
    .where(lessons: {user_id: user.id}, category_id: category.id)
    .merge(Result.correct_results).distinct}
  scope :not_learn, ->(user, category){where(category_id: category.id)
    .where.not id: Word.learned(user, category)}
  scope :all_words, ->(user, category){where(category_id: category.id)}
  scope :learned_no_category, ->(user){joins(:lessons)
    .where(lessons: {user_id: user.id})
    .merge(Result.correct_results).distinct}
  scope :not_learn_no_category, ->(user){where.not id: Word.learned_no_category(user)}
  scope :all_words_no_category, ->(user){}

  private
  def at_least_one_right_word_option
    valid = false
    word_options.each do |option|     
      valid = option.is_correct? ? true : valid unless option.marked_for_destruction?
    end 
    errors.add :word_options, I18n.t("at_least_1_right") unless valid
  end
end
