FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    isbn { Faker::Code.unique.isbn }
    description { Faker::Lorem.paragraph }

    trait :with_cover do
      after(:build) do |book|
        book.cover.attach(io: File.open(Rails.root.join("spec", "fixtures", "files", "example_cover.jpg")), filename: "example_cover.jpg", content_type: "image/jpeg")
      end
    end

    trait :with_content do
      after(:build) do |book|
        book.content.attach(io: File.open(Rails.root.join("spec", "fixtures", "files", "example_content.pdf")), filename: "example_content.pdf", content_type: "application/pdf")
      end
    end
  end
end
