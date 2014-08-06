class DecisionsController < ApplicationController
  def index
  	@decisions = Decision.all
  end

  def new
  	@decision = Decision.new
  end

  def create
  	decision = Decision.new(
  		params.require(:decision).permit(:text, :user_id)
  		)
  	if decision.save
	  	redirect_to decisions_path
  	end
  end

  def destroy
  	Decision.find(params[:id]).destroy
  	redirect_to decisions_path
  end
end
