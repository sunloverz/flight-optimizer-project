class FlightPriceIterator
  attr_reader :collection

  def initialize(collection: [])
    @collection = collection
  end

  def add_item(item)
    collection << item
  end

  def find_by_code(code)
    collection.find {|item| item.code == code }
  end
end
