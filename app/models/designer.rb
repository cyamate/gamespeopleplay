class Designer < ApplicationRecord
	has_many :game_designers
	has_many :games, :through => :game_designers
	has_many :expansion_designers
	has_many :expansions, :through => :expansion_designers
end
