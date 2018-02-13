Types::StatusType = GraphQL::EnumType.define do
  name "Statuses"
  description "Available statuses representing game states"

  value("new_instance", "A newly created game with no players")
  value("open", "An open game that has not yet been started")
  value("in_progress", "A game in progress")
  value("finished", "A finished game")
end