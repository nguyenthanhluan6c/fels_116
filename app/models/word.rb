class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :lesson

  has_many :word_options, dependent: :destroy
  has_many :results, dependent: :destroy
end
