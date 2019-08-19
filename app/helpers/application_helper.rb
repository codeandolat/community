module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def get_user_avatar(size)
    if current_user.avatar.attached?
      image_tag(current_user.avatar, height: size, width: size, class: "rounded")
    else
      image_tag(gravatar_image_url(current_user.email, size: size * 2), height: size, width: size, class: "rounded")
    end
  end
end
