class WelcomeController < ApplicationController
	
	def validate_token
		token = params[:token]
    current_user = AccessToken.find_by_access_token(token).user
     return redirect_to root_path if current_user.blank? || token.blank?
     sign_in(current_user)
     redirect_to root_path
	end
end