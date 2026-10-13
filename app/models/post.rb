class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { maximum: 150 }, uniqueness: true
  validates :body, length: { maximum: 2500 }
  belongs_to :user
end
