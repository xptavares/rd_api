require 'spec_helper'

describe RdApi::Contact do
  let(:attrs) do
   {
     :username => ENV["SALESFORCE_USERNAME"],
     :password => ENV["SALESFORCE_PASSWORD"],
     :security_token => ENV["SALESFORCE_SECURITY_TOKEN"],
     :client_id => ENV["SALESFORCE_CLIENT_ID"],
     :client_secret => ENV["SALESFORCE_CLIENT_SECRET"]
   }
  end
  let(:contact) { RdApi::Contact.new(attrs)  }
  let(:new_phone) { 'New phone' }
  let(:new_email) { 'New email' }
  let(:new_name) { 'New name' }
  let(:edit_phone) { 'Edit phone' }
  let(:edit_email) { 'Edit email' }
  let(:edit_name) { 'Edit name' }

  it '#find all' do
    VCR.use_cassette('contact_find_all') do
      expect(contact.all.count).to greater_than 0
    end
  end
  
  it '#create' do
    VCR.use_cassette('contact_create') do
      expect(contact.create(new_name, new_phone, new_email)).to be_truthy
    end
  end
  
  it '#update' do
    VCR.use_cassette('contact_update') do
      new_contact_id = contact.create(new_name, new_phone, new_email)
      expect(contact.update(new_contact_id, edit_name, edit_phone, edit_email)).to be_truthy
    end
  end
  
  it '#destroy' do
    VCR.use_cassette('contact_destroy') do
      new_contact_id = contact.create(new_name, new_phone, new_email)
      expect(contact.destroy(new_contact_id)).to be_truthy
    end
  end

end