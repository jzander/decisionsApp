class CriteriaController < ApplicationController
  def index
    @decision = Decision.find(params[:decision_id])
  	@criteria = @decision.criteria
  end

  def new
    @decision = Decision.find(params[:decision_id])
  	@criterion= Criterion.new
  end

  def create
    @decision = Decision.find(params[:decision_id])
  	criterion = Criterion.new(
  		params.require(:criterion).permit(:text, :importance)
  		)
    criterion.decision = @decision
  	if criterion.save
	  	redirect_to decision_criteria_path(@decision.id)
  	end
  end

  def destroy
    @decision = Decision.find(params[:decision_id])
  	Criterion.find(params[:id]).destroy
  	redirect_to decision_criteria_path(@decision.id)
  end
end
