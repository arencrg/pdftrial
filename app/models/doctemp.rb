class Doctemp
  include Mongoid::Document
  field :dateofsigning, type: String
  field :placeofsigning, type: String
  field :nameofprincipal, type: String
  field :nationalityofprincipal, type: String
  field :businessofprincipal, type: String
  field :addressofprincipal, type: String
  field :nameofagent, type: String
  field :nationalityofagent, type: String
  field :businessofagent, type: String
  field :addressofagent, type: String
  field :nameofagencyoroffice,  type: String
  field :transaction, type: String
  field :acts,  type: String
end
