module Products 
  class ProductSearch
    
    def initialize(q_name = nil, q_attr = nil)
      @q_name = q_name
      @q_attr = q_attr
    end

    attr_reader :q_name, :q_attr

    def search
      scope = Product.all
      scope = scope.where("name ILIKE '%#{q_name}%'") if q_name
      q_attr.present? ? attribute_search(scope) : scope.map(&:attributes)
    end

    private

    def attribute_search(scope)
      scope.map do |p| 
        sp = SearchableProduct.new(p)
        {q_attr => eval("sp.#{q_attr}")}
      end
    end
  end
end
