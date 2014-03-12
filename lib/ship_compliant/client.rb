module ShipCompliant
  class << self
    attr_accessor :ship_compliant_client
  end

  # Returns an instance of +Client+.
  def self.client
    self.ship_compliant_client ||= new_client_from_wsdl(configuration.wsdl)
  end

  # Replaces #client with custom WSDL
  #
  #   ShipCompliant.wsdl = 'https://ws-dev.shipcompliant.com/Services/1.2/ProductService.asmx?WSDL'
  def self.wsdl=(wsdl)
    self.ship_compliant_client = new_client_from_wsdl(wsdl)
  end

  private

  # Creates a new client from a WSDL url.
  def self.new_client_from_wsdl(wsdl)
    Client.new(wsdl: wsdl, log: configuration.log)
  end

  class Client < Savon::Client

    # Adds the required security credentials and formats
    # the message to match the ShipCompliant structure.
    #
    #   ShipCompliant.client.call(:some_operation, {
    #     'SomeKey' => 'SomeValue'
    #   })
    def call(operation, locals = {})
      locals['Security'] = ShipCompliant.configuration.credentials

      super(operation, message: {
        'Request' => locals
      })
    end
  end
end
