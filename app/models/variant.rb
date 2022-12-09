class Variant < ApplicationRecord
	belongs_to :product
	store :option, accessors: [:option1, :option2, :option3], coder: JSON
end
