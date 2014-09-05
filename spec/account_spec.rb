require 'spec_helper'

RSpec::Matchers.define :greater_than  do |expected|
  match do |actual|
    actual > expected
  end
end

describe RdApi::Account do

  let(:attrs) do
   {
     :username       = 'ENV["SALESFORCE_USERNAME"]',
     :password       = 'ENV["SALESFORCE_PASSWORD"]',
     :security_token = 'ENV["SALESFORCE_SECURITY_TOKEN"]',
     :client_id      = 'ENV["SALESFORCE_CLIENT_ID"]',
     :client_secret  = 'ENV["SALESFORCE_CLIENT_SECRET"]'
   }
  end
  let(:id) { '001o0000007gkAOAAY' }
  let(:name) { 'GenePoint' }
  let(:new_name) { 'New Name' }
  let(:new_edit_name) { 'New Edit Name' }
  let(:account) { RdApi::Account.new(attrs.username, attrs.password, attrs.security_token, attrs.client_id, attrs.client_secret) }
  let(:account_name) { account.find_by_id(id).Name }
  let(:new_account_id) { account.create(new_name) }
  
  it '#find all' do
    expect(account.all.count).to greater_than 0
  end
  
  it '#account_name' do
    expect(account_name).to eq name
  end
  
  it '#create' do
    expect(account.find_by_id(new_account_id).Name).to eq new_name
  end
  
  it '#update' do
    expect(account.update(new_account_id, new_edit_name)).to be_truthy
  end
  
  it '#update, compere edit names' do
    account.update(new_account_id, new_edit_name)
    expect(account.find_by_id(new_account_id).Name).to eq new_edit_name
  end
  
  it '#destroy' do
    expect(account.destroy(new_account_id)).to be_truthy
  end
  	
end