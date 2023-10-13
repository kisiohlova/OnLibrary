require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_book) { create(:book) }
  let(:invalid_book) { build(:book, title: nil) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:isbn) }
    it { should validate_uniqueness_of(:isbn) }
    it { should validate_length_of(:description).is_at_most(2000) }
  end

  it "is valid with valid attributes" do
    expect(valid_book).to be_valid
  end

  it "is not valid without a title" do
    expect(invalid_book).not_to be_valid
  end
end
