class CriterionAnswer
  include Mongoid::Document
  field :rating, type: Integer


  belongs_to :criteria
  belongs_to :answer
end
