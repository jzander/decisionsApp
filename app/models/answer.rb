class Answer
  include Mongoid::Document
  field :text, type: String
  
  belongs_to :decision
end
