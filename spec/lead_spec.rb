require 'spec_helper'

describe RdApi::Lead do

  let(:attrs) do
   {
     :username => ENV["SALESFORCE_USERNAME"],
     :password => ENV["SALESFORCE_PASSWORD"],
     :security_token => ENV["SALESFORCE_SECURITY_TOKEN"],
     :client_id => ENV["SALESFORCE_CLIENT_ID"],
     :client_secret => ENV["SALESFORCE_CLIENT_SECRET"]
   }
  end
  let(:lead) { RdApi::Lead.new(attrs)  }
  let(:new_title) { 'New title' }
  let(:new_phone) { 'New phone' }
  let(:new_company) { 'New company' }
  let(:new_email) { 'new@email.com' }
  let(:new_first_name) { 'New first name' }
  let(:new_last_name) { 'New last name' }
  let(:edit_title) { 'Edit title' }
  let(:edit_phone) { 'Edit phone' }
  let(:edit_company) { 'Edit company' }
  let(:edit_email) { 'edit@email.com' }
  let(:edit_first_name) { 'Edit first name' }
  let(:edit_last_name) { 'Edit last name' }

  it '#find all' do
    VCR.use_cassette('lead_find_all') do
      expect(lead.all.count).to greater_than 0
    end
  end
  
  it '#create' do
    VCR.use_cassette('lead_create') do
      expect(lead.create(new_title, new_phone, new_company, new_email, new_first_name, new_last_name)).to be_truthy
    end
  end
  
  it '#update' do
    VCR.use_cassette('lead_update') do
      new_lead_id = lead.create(new_title, new_phone, new_company, new_email, new_first_name, new_last_name)
      expect(lead.update(new_lead_id, edit_title, edit_phone, edit_company, edit_email, edit_first_name, edit_last_name)).to be_truthy
    end
  end
  
  it '#destroy' do
    VCR.use_cassette('lead_destroy') do
      new_lead_id = lead.create(new_title, new_phone, new_company, new_email, new_first_name, new_last_name)
      expect(lead.destroy(new_lead_id)).to be_truthy
    end
  end

end