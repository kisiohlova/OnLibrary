class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :title, format: { with: /\A[\w.,!?:&'() \t]*\z/ }, length: { maximum: 150 }
  validates :author, format: { with: /\A[\w \t]*\z/ }
  validates :description, format: { with: /\A[\w.,!?:&'() \t]*\z/ }, length: { maximum: 1000 }
  validates :isbn, uniqueness: { case_sensitive: false }
  validates :isbn, format: { with: /\A\d[\d-]*\d\z/, message: "only allows numbers and dashes" }

  scope :ordered, -> { order(:title) }
end
