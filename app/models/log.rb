class Log < ApplicationRecord
  belongs_to :game
  has_many :player_scores, :dependent => :destroy
  accepts_nested_attributes_for :player_scores, :reject_if => lambda { |p| p[:player_id].blank? }, :allow_destroy => true
  has_many :log_expansions, :dependent => :destroy
  accepts_nested_attributes_for :log_expansions, :reject_if => lambda { |l| l[:expansion_id].blank? }, :allow_destroy => true
end
