require 'rails_helper'

RSpec.describe CheesyIndexService, type: :service do
  it 'requests the totalresults from a google search' do
    cheesyindex = CheesyIndexService.new
    totalrequests = cheesyindex.get_total_requests('quote content')
    expect(totalrequests).to be_an(Integer)
  end
end
