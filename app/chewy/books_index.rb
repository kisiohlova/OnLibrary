class BooksIndex < Chewy::Index
  index_name { "books_#{Rails.env}" }
  index_scope Book
  field :title, type: 'text', analyzer: 'standard'
  field :author, type: 'text', analyzer: 'standard'
  field :description, type: 'text', analyzer: 'standard'
end
