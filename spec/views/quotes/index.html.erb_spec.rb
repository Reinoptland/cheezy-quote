require 'rails_helper'

RSpec.describe "quotes/index", type: :view do
  before(:each) do
    assign(:quotes, [
      Quote.create!(
        :source => "Source",
        :content => "MyText"
      ),
      Quote.create!(
        :source => "Source",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of quotes" do
    render
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
