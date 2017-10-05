require 'rails_helper'

RSpec.describe "quotes/index", type: :view do
  include Devise::Test::ControllerHelpers

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
  context "Public view" do
    it "renders a list of quotes" do
      render
      assert_select "tr>td", :text => "Source".to_s, :count => 2
      assert_select "tr>td", :text => "MyText".to_s, :count => 2
    end

    it "when an admin is not logged in it does not show links for edit, destroy" do
      render
      assert_select "tr>td>a", :text => "Edit".to_s, :count => 0
      assert_select "tr>td>a", :text => "Destroy".to_s, :count => 0
    end
  end

  context "Admin authenticated view" do
    login_admin

    it "when an admin is logged it shows links for edit and destroy quote" do
      render

      assert_select "tr>td>a", :text => "Edit".to_s, :count => 2
      assert_select "tr>td>a", :text => "Destroy".to_s, :count => 2
    end
  end

end
