require "rails_helper"

RSpec.describe "books/show", type: :view do
  let(:user) { create(:user) }
  let(:book) { create(:book, :with_content) }

  before do
    allow(view).to receive(:user_signed_in?).and_return(user.present?)
    assign(:book, book)
    render
  end

  it "displays the PDF viewer for signed-in users" do
    if user.present? && book.content.attached?
      expect(rendered).to include("src=\"https://documentcloud.adobe.com/view-sdk/main.js\"")
    else
      expect(rendered).not_to include("src=\"https://documentcloud.adobe.com/view-sdk/main.js\"")
    end
  end
end
