class CriteriaController < ApplicationController
  before_action :get_decision, :check_security

    def index
    	@criteria = @decision.criteria
    end

    def new
    	@criterion= Criterion.new
    end

    def create
      #find our parent decision that we should attach to?
    	criterion = Criterion.new(
    		params.require(:criterion).permit(:text, :importance)
    		)

      #attaches this criterion to a decision.

      criterion.decision = @decision
    	if criterion.save
  	  	redirect_to decision_criteria_path(@decision.id)
    	end
    end

    def destroy
    	Criterion.find(params[:id]).destroy
    	redirect_to decision_criteria_path(@decision.id)
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
