class ProductsController < ApplicationController
  def index
    @query = params[:query]
    scope = Product.all
    scope = scope.where("name ILIKE '%#{@query}%'") if @query
    @products = scope
  end
end
