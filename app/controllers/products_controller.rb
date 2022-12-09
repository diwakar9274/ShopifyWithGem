class ProductsController < ApplicationController
	def index
		@products = Product.search_product(params[:query])
	end
end