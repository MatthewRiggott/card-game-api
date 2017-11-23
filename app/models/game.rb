class Game < ApplicationRecord
  attribute :status, :integer, default: 0
  attr_accessor :current_player

  validates :name, presence: true

  def attributes
    super.merge({'current_player' => @current_player})
  end
  
  enum status: [:new_instance, :open, :in_progress, :finished]
end