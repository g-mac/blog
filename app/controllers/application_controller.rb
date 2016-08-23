class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Simple Token Authentication handling: https://github.com/gonzalo-bulnes/simple_token_authentication
  # use for api? or whole app?
  # acts_as_token_authentication_handler_for User


  # this is to make sure that the default application.slim layout is not used for json responses

  layout :mime_layout

  private def mime_layout
    case params[:format]
      when 'json'
        false
      else
        'application'
    end
  end

end
