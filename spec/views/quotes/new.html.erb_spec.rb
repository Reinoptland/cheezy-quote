require 'rails_helper'

RSpec.describe "quotes/new", type: :view do
  before(:each) do
    assign(:quote, Quote.new(
      :source => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new quote form" do
    render

    assert_select "form[action=?][method=?]", quotes_path, "post" do

      assert_select "input[name=?]", "quote[source]"

      assert_select "textarea[name=?]", "quote[content]"
    end
  end
end
