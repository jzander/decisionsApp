class DecisionsController < ApplicationController
  def home
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
 
  # def current_user
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

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
    @user = User.new
    @is_login = true
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
      if Decision.count < 1
      redirect_to new_decision_path
      else
      redirect_to decisions_path
    end
  end
end
