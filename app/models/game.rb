class Game < ApplicationRecord
  belongs_to :publisher
  has_many :logs
  has_many :expansions
  has_many :player_scores, :through => :logs
  has_many :game_designers
  has_many :designers, :through => :game_designers
  accepts_nested_attributes_for :game_designers, :reject_if => lambda { |d| d[:designer_id].blank? }, :allow_destroy => true
end
