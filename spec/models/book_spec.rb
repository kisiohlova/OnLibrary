require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:title).is_at_most(150) }
    it { should validate_length_of(:description).is_at_most(1000) }
    it { should allow_value("978-3-16-148410-0").for(:isbn) }

    describe "validation" do
      subject { Book.new(title: "Book", author: "Author", description: "Text") }
      it { should validate_uniqueness_of(:isbn) }
    end
  end
end
