class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	#def after_sign_in_path_for(resource)
 		# render "items/index" 
	#end
	#def after_sign_out_path_for(resource_or_scope)
  	#	request.referrer
	#end

	def welcome
	end


  private

	  def render_403
	  	render file: "public/403.html", status: 403 
	  end

	  def render_404
	  	render file: "public/404.html", status: 404 
	  end

	  def check_if_admin
		#render_403 unless params[:admin]
	end

end
