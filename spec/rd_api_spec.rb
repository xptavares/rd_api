require 'spec_helper'

describe RdApi do

	let(:one) { 1 }
	let(:two) { 2 }
	let(:three) { 3 }
	let(:out_two) { RdApi.sum_a one }
	let(:out_three) { RdApi.sum_a_and_b(one, two) }
	let(:cliente_name) { RdApi.find_account.Name }
	let(:name) {'Alexandre'}

  	it '#cliente_name' do
  		expect(name).to eq cliente_name
  	end
end