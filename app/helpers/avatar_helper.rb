module AvatarHelper
  def avatar(size)
    image_tag current_user.gravatar_url(:size => size), alt:"#{current_user.email}'s Avatar"
  end
end
