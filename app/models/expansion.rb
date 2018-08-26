class Expansion < ApplicationRecord
  belongs_to :publisher
  belongs_to :game
  has_many :player_scores, :through => :logs
  has_many :expansion_designers
  has_many :designers, :through => :expansion_designers
  accepts_nested_attributes_for :expansion_designers, :reject_if => lambda { |d| d[:designer_id].blank? }, :allow_destroy => true
end
