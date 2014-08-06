class DecisionsController < ApplicationController
  def home
     @user = User.new
  end

  def index
    if !current_user
      redirect_to home_path
      return
    end
  #	@decisions = Decision.where(user_id: current_user.id)
    @decisions = current_user.decisions
  end

  def new
  	@decision = Decision.new
  end

  def create
    if !current_user
      redirect_to new_session_path
      return
    end
    decision = current_user.decisions.new(
  		params.require(:decision).permit(:text)
  		)
    # with this decision object, attach it to the user.
    decision.user = current_user
  	if decision.save
	  	redirect_to decisions_path
  	end
  end

  def destroy
  	Decision.find(params[:id]).destroy
  	redirect_to decisions_path
  end
end
