class WordOption < ActiveRecord::Base
  belongs_to :word

  has_many :results

  validates_presence_of :content
end
