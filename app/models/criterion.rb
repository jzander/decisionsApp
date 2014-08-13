class Criterion
  include Mongoid::Document
  field :text, type: String
  field :importance, type: Integer
  
  belongs_to :decision
  has_many :answers



end
