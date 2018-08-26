class Expansion < ApplicationRecord
  belongs_to :publisher
  belongs_to :game
  has_many :player_scores, :through => :logs
  has_many :expansion_designers, :dependent => :destroy
  accepts_nested_attributes_for :expansion_designers, :reject_if => lambda { |d| d[:designer_id].blank? }, :allow_destroy => true
  has_many :log_expansions
  has_many :logs, :through => :log_expansions
end
