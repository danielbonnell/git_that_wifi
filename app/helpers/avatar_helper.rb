module AvatarHelper
  def user_avatar(size)
    unless current_user.avatar.nil?
      image_tag current_user.avatar,
      size: "#{size}",
      alt: "#{current_user.first_name}'s Avatar"
    else
      image_tag current_user.gravatar_url(size: size),
      alt: "#{current_user.first_name}'s Avatar"
    end
  end
end
