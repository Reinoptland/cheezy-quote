require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'is database authenticable' do
    admin = Admin.create(
      email: 'test@test.com',
      password: 'test1234',
    )
    expect(admin.valid_password?('test1234')).to be_truthy
  end
end
