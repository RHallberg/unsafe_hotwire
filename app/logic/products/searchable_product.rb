module Products
  class SearchableProduct 

    def initialize(product)
      @product = product
    end

    attr_reader :product

    def method_missing(name, *args)
      return product.send(name, *args) if product.methods.include?(name)
      "Not available"
    end
  end
end
