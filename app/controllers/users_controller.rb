class UsersController < ApplicationController
def show
	@users = current_user
	#@users = User.find(params[:id])
end

def index
	@users = current_user
	#@users = User.all
end

end
