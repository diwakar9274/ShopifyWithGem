class Product < ApplicationRecord
	serialize :options, Array
	has_many :variants,dependent: :destroy


	def self.search_product(search)
		all_products = Product.all
		unless search.blank?
			variants = {}
			all_products.each do |product|
			  product.options.each do |option|
			    if variants[option["product_id"]]
			      variants[option["product_id"]] = variants[option["product_id"]].push(option["values"]).flatten
			    else
			      variants[option["product_id"]] = option["values"]
			    end
			  end
			end

			ele = search.downcase
			result = []
			variants.each do |key,value|
			  if value.any? {|e| e.downcase == ele}
			    result.push(key)
			  end
			end
			return all_products.where(product_id: result)
		end
		return all_products
	end
end
