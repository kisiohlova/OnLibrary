class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :title, length: { maximum: 150 }
  validates :description, length: { maximum: 1000 }
  validates :isbn, uniqueness: true
  validates :isbn, format: { with: /\A[\d-]*\z/, message: "only allows numbers and dashes" }
end
