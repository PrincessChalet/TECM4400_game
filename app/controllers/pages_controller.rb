class PagesController < ApplicationController

def my_groups
	@user_groups = current_user.groups
end

end