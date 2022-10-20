module Products 
  class ProductSearch
    
    def initialize(q_name = nil, q_attr = nil, unsafe_mode: false)
      @q_name = q_name
      @q_attr = q_attr
      @unsafe_mode = unsafe_mode
    end

    attr_reader :q_name, :q_attr, :unsafe_mode

    def search
      scope = Product.all
      scope = scope.where("name ILIKE '%#{q_name}%'") if q_name
      return scope.map(&:attributes) unless q_attr.present?
      unsafe_mode  ? unsafe_attribute_search(scope) : attribute_search(scope) 
    end

    private

    def attribute_search(scope)
      scope.map do |p| 
        sp = SearchableProduct.new(p)
        {q_attr => sp.send(q_attr).to_s}
      end
    end

    def unsafe_attribute_search(scope)
      scope.map do |p| 
        sp = SearchableProduct.new(p)
        {q_attr => eval("sp.#{q_attr}").to_s}
      end
    end
  end
end
