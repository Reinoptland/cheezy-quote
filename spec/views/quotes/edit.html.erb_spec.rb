require 'rails_helper'

RSpec.describe "quotes/edit", type: :view do
  before(:each) do
    @quote = assign(:quote, Quote.create!(
      :source => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit quote form" do
    render

    assert_select "form[action=?][method=?]", quote_path(@quote), "post" do

      assert_select "input[name=?]", "quote[source]"

      assert_select "textarea[name=?]", "quote[content]"
    end
  end
end
