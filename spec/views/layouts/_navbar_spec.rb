require 'rails_helper'

RSpec.describe "layouts/_navbar", type: :view do
  include Devise::Test::ControllerHelpers

  context "Public view" do
    it "has a link to All Quotes but no links to new or logout" do
      render
      assert_select "a", :text => "Random Quote".to_s, :count => 1
      assert_select "a", :text => "All Quotes".to_s, :count => 1
      assert_select "input#q", :count => 1

      assert_select "a", :text => "Logout".to_s, :count => 0
      assert_select "a", :text => "New Quote".to_s, :count => 0

    end
  end

  context "Admin authenticated view" do
    login_admin

    it "when an admin is logged it shows links to logout and new quote" do
      render

      assert_select "a", :text => "All Quotes".to_s, :count => 1
      assert_select "a", :text => "Logout".to_s, :count => 1
      assert_select "a", :text => "New Quote".to_s, :count => 1
      assert_select "a", :text => "Update Cheesy Score".to_s, :count => 1
    end
  end
end
