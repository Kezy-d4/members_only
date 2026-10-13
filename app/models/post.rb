class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { maximum: 150 }
  validates :body, length: { maximum: 2500 }, uniqueness: true
  belongs_to :user
end
