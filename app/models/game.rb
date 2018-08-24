class Game < ApplicationRecord
  belongs_to :designer
  belongs_to :publisher
  has_many :logs
  has_many :expansions
  has_many :player_scores, :through => :logs
end
