module UsersHelper
  def avatar_url(user, options = {size: 80})
    if user.avatar.present?
      user.avatar
    else
      size        = options[:size]
      # default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
  end
  def current_user?(user)
    user == current_user
  end
end
