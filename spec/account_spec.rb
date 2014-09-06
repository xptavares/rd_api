require 'spec_helper'

describe RdApi::Account do

  let(:attrs) do
   {
     :username => ENV["SALESFORCE_USERNAME"],
     :password => ENV["SALESFORCE_PASSWORD"],
     :security_token => ENV["SALESFORCE_SECURITY_TOKEN"],
     :client_id => ENV["SALESFORCE_CLIENT_ID"],
     :client_secret => ENV["SALESFORCE_CLIENT_SECRET"]
   }
  end
  let(:id) { '001o0000007gkAOAAY' }
  let(:name) { 'GenePoint' }
  let(:new_name) { 'New Name' }
  let(:new_edit_name) { 'New Edit Name' }
  let(:account) { RdApi::Account.new(attrs)  }
  
  it '#find all' do
    VCR.use_cassette('find_all_account') do
      expect(account.all.count).to greater_than 0
    end
  end
  
  it 'find by id' do
    VCR.use_cassette('find_by_id_account') do
      expect(account.find_by_id(id).Name).to eq name
    end
  end
  
  it '#create' do
    VCR.use_cassette('create_account') do
      new_account_id = account.create(new_name)
      expect(account.find_by_id(new_account_id).Name).to eq new_name
    end
  end
  
  it '#update' do
    VCR.use_cassette('update_account') do
      new_account_id = account.create(new_name)
      expect(account.update(new_account_id, new_edit_name)).to be_truthy
    end
  end
  
  it '#update, compere edit names' do
    VCR.use_cassette('update_name_account') do
      new_account_id = account.create(new_name)
      account.update(new_account_id, new_edit_name)
      expect(account.find_by_id(new_account_id).Name).to eq new_edit_name
    end
  end
  
  it '#destroy' do
    VCR.use_cassette('destroy_account') do
      new_account_id = account.create(new_name)
      expect(account.destroy(new_account_id)).to be_truthy
    end
  end
  	
end