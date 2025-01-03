class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 1, maximum: 250 }
  validates :body, length: { minimum: 1, maximum: 10_000 }
end
