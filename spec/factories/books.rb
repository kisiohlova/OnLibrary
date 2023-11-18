FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    isbn { Faker::Code.unique.isbn }
    description { Faker::Lorem.paragraph }

    trait :with_cover do
      cover { Rack::Test::UploadedFile.new("spec/fixtures/files/example_cover.jpg", "image/jpeg") }
    end

    trait :with_content do
      content { Rack::Test::UploadedFile.new("spec/fixtures/files/example_content.pdf", "application/pdf") }
    end

    trait :search_1 do
      title { "Ruby Programming" }
      author { "John Doe" }
      description { "A comprehensive guide to learn Ruby" }
    end

    trait :search_2 do
      title { "Rails Tutorial" }
      author { "Lucky Smith" }
      description { "Learn Ruby on Rails from scratch" }
    end
  end
end
