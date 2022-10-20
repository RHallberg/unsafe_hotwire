class ProductsController < ApplicationController
  def index
    @query = params[:query]
    @attribute = params[:attribute]
    @unsafe_mode = params[:unsafe_mode] == "1"
    @products = Products::ProductSearch.new(@query, @attribute, unsafe_mode: @unsafe_mode).search 
  end
end
