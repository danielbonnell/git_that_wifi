module AvatarHelper
  def avatar(img_size)
    image_tag current_user.gravatar_url(size: img_size),
    alt: "#{current_user.email}'s Avatar"
  end
end
