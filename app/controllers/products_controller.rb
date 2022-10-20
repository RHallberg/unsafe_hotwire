class ProductsController < ApplicationController
  def index
    @query = params[:query]
    @attribute = params[:attribute]
    @products = Products::ProductSearch.new(@query, @attribute).search 
  end
end
