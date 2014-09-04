require 'spec_helper'

describe RdApi do

	let(:id) { '001o0000007gkAOAAY' }
	let(:name) { 'GenePoint' }
	let(:new_name) { 'New Name' }
	let(:account_name) { RdApi.find_accont_by_id(id).Name }
	let(:new_account_id) { RdApi.create_account new_name }

  	it '#account_name' do
  		expect(account_name).to eq name
  	end

  	it '#create_account' do
  		expect(RdApi.find_accont_by_id(new_account_id).Name).to eq new_name
  	end
  	
end