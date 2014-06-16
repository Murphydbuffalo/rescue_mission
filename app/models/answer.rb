class Answer < ActiveRecord::Base
 belongs_to :user
 belongs_to :question
 validates :title, presence: true, length: {minimum: 10}
 validates :body, presence: true, length: {minimum: 25}
end