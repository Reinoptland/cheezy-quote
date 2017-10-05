require 'rails_helper'

RSpec.describe "quotes/show", type: :view do
  include Devise::Test::ControllerHelpers
  
  before(:each) do
    @quote = assign(:quote, Quote.create!(
      :source => "Source",
      :content => "MyText"
    ))
  end

  context "Public view" do
    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/Source/)
      expect(rendered).to match(/MyText/)
    end

    it "when an admin is not logged in it does not show a link for edit" do
      render
      assert_select "a", :text => "Edit".to_s, :count => 0
    end
  end

  context "Admin authenticated view" do
    login_admin

    it "when an admin is logged it shows a link for edit" do
      render

      assert_select "a", :text => "Edit".to_s, :count => 1
    end
  end
end
