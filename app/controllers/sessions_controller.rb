class SessionsController < Devise::SessionsController
  #need to fix this security hole
  skip_before_action :verify_authenticity_token
  # skip_before_action :verify_authenticity_token, :only => [:new] #need to fix this security hole

  respond_to :json

  # def new
  #   respond_to do |format|
  #     format.html { super }
  #     format.json { render json: current_user }
  #   end
  # end

end