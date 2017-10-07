require 'rails_helper'

RSpec.describe "quotes/show", type: :view do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @quote = assign(:quote, create(:quote))
  end

  context "Public view" do
    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/The allknowing source/)
      expect(rendered).to match(/The profound content/)
      assert_select "img.full_wegde", :count => 5
    end

    it "when an admin is not logged in it does not show a link for edit" do
      render
      assert_select "a", :text => "Edit".to_s, :count => 0
    end

    it "displays the cheesy_score with cheese wedges" do
      @quote = assign(:quote, create(:quote, cheesy_score: 3))
      render
      assert_select "img.full_wegde", :count => 3
      assert_select "img.empty_wegde", :count => 2
    end

    it "it displays questionmark chees wedges when the quote has no cheesy_score" do
      @quote = assign(:quote, create(:quote, cheesy_score: nil))
      render
      assert_select "img.question_wegde", :count => 5
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
