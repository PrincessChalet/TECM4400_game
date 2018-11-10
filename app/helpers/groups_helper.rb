module GroupsHelper

def user_allowed
  user_signed_in? && (current_user.id == @group.user_id)
end

end
