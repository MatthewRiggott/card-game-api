class Game < ApplicationRecord
  attribute :status, :integer, default: 0
  has_many :player_inputs
  has_many :players, through: :player_inputs
  attr_accessor :current_player
  before_save :update_state_key
  before_create :set_state_key

  validates :name, presence: true

  def attributes
    super.merge({'current_player' => @current_player})
  end

  def host?(player_id)
    player_id == players[0]
  end

  def host
    players[0]
  end
  
  enum status: [:new_instance, :open, :in_progress, :finished]

  private

  def set_state_key
    self.current_state = SecureRandom.uuid
  end 

  def update_state_key
    if self.changed?
      self.current_state = SecureRandom.uuid
    end
  end

end