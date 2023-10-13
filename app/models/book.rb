class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true
  validates :description, length: { maximum: 2000 }
end
