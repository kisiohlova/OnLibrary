class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true, length: { minimum: 10, maximum: 13}
  validates :description, length: { maximum: 2000 }
end
