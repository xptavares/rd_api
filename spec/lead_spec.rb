require 'spec_helper'

describe RdApi::Lead do
  let(:attrs) do
   {
     :username       = 'ENV["SALESFORCE_USERNAME"]',
     :password       = 'ENV["SALESFORCE_PASSWORD"]',
     :security_token = 'ENV["SALESFORCE_SECURITY_TOKEN"]',
     :client_id      = 'ENV["SALESFORCE_CLIENT_ID"]',
     :client_secret  = 'ENV["SALESFORCE_CLIENT_SECRET"]'
   }
  end
  let(:lead) { RdApi::Lead.new(attrs.username, attrs.password, attrs.security_token, attrs.client_id, attrs.client_secret)  }

  it '#find all' do
    fail
  end
  
  it '#create' do
    fail
  end
  
  it '#update' do
    fail
  end
  
  it '#destroy' do
    fail
  end

end