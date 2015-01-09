module AvatarHelper
  def avatar(img_size)
    if current_user.avatar == nil
      image_tag current_user.gravatar_url(
        size: img_size,
        alt: "#{current_user.first_name} #{current_user.last_name}'s Avatar"
      )
    else
      image_tag(
        current_user.avatar,
        size: "#{img_size}",
        alt: "#{current_user.first_name} #{current_user.last_name}'s Avatar"
      )
    end
  end
end
