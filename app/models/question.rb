class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :title, presence: true, length: {minimum 10}
  validates :body, presence: true, length: {minimum 25}
end