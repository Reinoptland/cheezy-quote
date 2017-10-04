require 'rails_helper.rb'

describe "the signin process", :type => :feature do
  before :each do
    Admin.create(email: 'user@example.com', password: 'password')
  end

  it "signs in an admin" do
    visit '/admins/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "it does not sign in with an invalid password" do
    visit '/admins/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'wrongpassword'

    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it "it locks the account after 3 invalid requests" do
    3.times do
      visit '/admins/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'wrongpassword'

      click_button 'Log in'
    end
    expect(page).to have_content 'Your account is locked'
  end
end
