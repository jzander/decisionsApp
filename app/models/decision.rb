class Decision
  include Mongoid::Document
  field :text, type: String

  belongs_to :user
  has_many :criteria
end
