module TestingMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      test_admin = Admin.create(
        email: 'test@test.com',
        password: 'test1234',
      )
      sign_in test_admin
    end
  end
end
