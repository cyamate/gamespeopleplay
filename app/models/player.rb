class Player < ApplicationRecord
	has_many :player_scores
	has_many :logs, :through => :player_scores
end
