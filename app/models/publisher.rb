class Publisher < ApplicationRecord
	has_many :games
	has_many :expansions
end
