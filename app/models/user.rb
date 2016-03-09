class User < ActiveRecord::Base
  has_many :active_relationships,  class_name:  "Relationship",
    foreign_key: "follower_id",  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
    foreign_key: "followed_id",  dependent:  :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :lessons
  has_many :activities

  has_secure_password
  attr_accessor :remember_token
  
  before_save :downcase_email
  
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  
  def create_digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    remember_token = User.new_token
    update_attributes remember_digest: User.create_digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end
  
  private
  def downcase_email
    email = email.downcase if email.present?
  end
end
