require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryGirl.build_stubbed(:book) }
  let(:author) { FactoryGirl.build_stubbed(:author) }

  it "belongs to an author" do
    book.author = author

    expect(book.author).to eq(author)
    # puts author.persisted?
  end
end
