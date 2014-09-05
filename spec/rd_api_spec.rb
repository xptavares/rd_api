require 'spec_helper'

describe RdApi::Account do

	let(:id) { '001o0000007gkAOAAY' }
	let(:name) { 'GenePoint' }
	let(:new_name) { 'New Name' }
	let(:new_edit_name) { 'New Edit Name' }
	let(:account) { RdApi::Account.new }
	let(:account_name) { account.find_by_id(id).Name }
	let(:new_account_id) { account.create(new_name) }

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