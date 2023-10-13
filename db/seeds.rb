require "faker"

30.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Code.unique.isbn,
    description: Faker::Lorem.paragraph
  )
end
