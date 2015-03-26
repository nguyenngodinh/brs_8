module UsersHelper
  def avatar_url(user, options = { size: 80 })
    if user.avatar_url.present?
      user.avatar_url
    else
      size        = options[:size]
      # default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
  end
end
