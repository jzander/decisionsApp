class CriteriaController < ApplicationController
  before_action :get_decision, :check_security

    def index
    	@decision.criteria.build
      @criteria = Criterion.all
    end

    def new
    	@criterion = Criterion.new
      @user = User.new
      @is_login = true
    end

    def current_user
      if User && :user_id && session[:user_id]
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      else
        return false
      end
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
    def criteria_params
      params.require(:criterion).permit(
        :text, :importance, answer_ids: [])
    end

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
