require 'spec_helper'

describe RdApi::Account do

	let(:id) { '001o0000007gkAOAAY' }
	let(:name) { 'GenePoint' }
	let(:new_name) { 'New Name' }
	let(:account) { RdApi::Account.new(id, name) }
	let(:account_name) { account.find_by_id.Name }
	let(:new_account_id) { account.create new_name }

  	it '#account_name' do
  		expect(account_name).to eq name
  	end

  	it '#create_account' do
  		account.id = new_account_id
  		expect(account.find_by_id.Name).to eq new_name
  	end
  	
end