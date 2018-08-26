class Designer < ApplicationRecord
	has_many :expansions
	has_many :game_designers
	has_many :games, :through => :game_designers
end
