class Log < ApplicationRecord
  belongs_to :game
  belongs_to :expansion, :required => false
  has_many :player_scores, :dependent => :destroy
  accepts_nested_attributes_for :player_scores, :reject_if => lambda { |p| p[:player_id].blank? }, :allow_destroy => true
end
