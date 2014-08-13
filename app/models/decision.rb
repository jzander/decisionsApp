class Decision
  include Mongoid::Document
  field :text, type: String

  belongs_to :user
  has_many :criteria
  has_many :answers

  accepts_nested_attributes_for :criteria

	def criterion_answers
      CriterionAnswer.find answer_ids
    end
    #accepts_nested_attributes_for :answers

    def criterion_answer_ids
      ret = []
      self.criteria.each do |c|
        c.criterion_answer.each do |ca|
          ret.push ca.id
        end
      end
      ret 
    end
  
end
