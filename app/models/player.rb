class Player < ApplicationRecord
  validates :name, presence: true

  has_many :player_inputs
  has_many :games, through: :player_inputs

end