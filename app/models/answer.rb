class Answer
  include Mongoid::Document
  field :text, type: String

  has_many :criterion_answers
  belongs_to :decision

  accepts_nested_attributes_for :criterion_answers

end
