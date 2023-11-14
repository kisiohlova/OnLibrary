class Book < ApplicationRecord
  has_one_attached :cover, dependent: :destroy
  has_one_attached :content, dependent: :destroy

  validates :title, :author, :isbn, presence: true
  validates :title, length: { maximum: 150 }
  validates :description, length: { maximum: 1000 }
  validates :isbn, uniqueness: { case_sensitive: false }
  validates :isbn, format: { with: /\A(?:\d[\-]?){9}[\dXx]$|^(?:\d[\-]?){13}\z/, message: "only allows 10 or 13 digits, and optional hyphens" }

  scope :ordered, -> { order(:title) }
end
