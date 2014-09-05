require 'restforce'

module RdApi
  
  class Lead
    attr_accessor :client
    
    def initialize(attrs)
      @client = Restforce.new(attrs)
    end
  
    def all
      @client.query('select Id, Title, Phone, Company, Email from Lead')
    end
  
    def find_by_id(id:)
      @client.find('Lead', id)
    end
  
    def create(title:, phone:, company:, email:)
      @client.create('Lead', Title: title, Phone: phone, Company: company, Email: email)
    end

    def update(id:, title:, phone:, company:, email:)
      @client.update('Lead', Id: id, Title: title, Phone: phone, Company: company, Email: email)
    end

    def destroy(id:)
      @client.destroy('Lead', id)
    end
  end
end