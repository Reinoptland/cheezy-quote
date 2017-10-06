require 'rails_helper.rb'

describe "searching quotes", :type => :feature do
  before :each do
    create :quote
    Quote.__elasticsearch__.import force: true
    Quote.__elasticsearch__.refresh_index!
  end

  it "searches quotes for content" do
    visit '/'

    fill_in 'q', with: 'profound'
    click_on 'search'

    expect(page).to have_content 'The profound content'
  end

  it "searches quotes for sources" do
    visit '/'

    fill_in 'q', with: 'allknowing'
    click_on 'search'

    expect(page).to have_content 'The allknowing source'
  end

  it "displays feedback when nothing is found" do
    visit '/'

    fill_in 'q', with: 'nonexistent'
    click_on 'search'

    expect(page).to have_content 'We didn\'t find anything, sorry!'
  end
end
