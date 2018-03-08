Types::ActionType = GraphQL::ObjectType.define do
  name 'Action'

  field :testAction, types.String do
    description "An example field added by the generator"
    argument :input, !types.String

    resolve ->(obj, args, ctx) {
      "Hello World! " + args[:input]
    }
  end
end