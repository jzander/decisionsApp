class CriteriaController < ApplicationController
  before_action :get_decision, :check_security

    def index
      @answers = @decision.answers
      @answer = Answer.new
    end

    def new
      @answer = Answer.new
    end

    def create
      #find our parent decision that we should attach to?
      answer = Answer.new(
        params.require(:answer).permit(:text)
        )

      #attaches this answer to a decision.

      answer.decision = @decision
      if answer.save
        redirect_to decision_answers_path(@decision.id)
      end
    end

    def destroy
      Answer.find(params[:id]).destroy
      redirect_to decision_answers_path(@decision.id)
    end

  private
    def get_decision
       #find our parent decision that we should attach to
       @decision = Decision.find(params[:decision_id])
    end

    def check_security
      #if current_user && @decision.user == current_user
      if !current_user || @decision.user != current_user
          redirect_to home_path
      end
    end
end
