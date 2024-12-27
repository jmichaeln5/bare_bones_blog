class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 1, maximum: 100 }
  validates :body, length: { minimum: 1, maximum: 10000 }
end
