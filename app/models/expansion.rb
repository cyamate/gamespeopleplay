class Expansion < ApplicationRecord
  belongs_to :publisher
  belongs_to :designer
  belongs_to :game
  has_many :player_scores, :through => :logs
end
