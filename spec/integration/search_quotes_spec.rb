require 'rails_helper.rb'

describe "searching quotes", :type => :feature do
  before :each do
    create :quote
  end

  it "searches quotes for content" do
    visit '/'

    fill_in 'Search', with: 'profound'
    click_button 'Search'

    expect(page).to have_content 'The profound content'
  end

  it "searches quotes for sources" do
    visit '/'

    fill_in 'Search', with: 'allknowing'
    click_button 'Search'

    expect(page).to have_content 'The allknowing source'
  end
end
