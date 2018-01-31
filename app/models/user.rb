class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = find_by(uid: auth_info[:uid])
    if user.nil?
      create do |new_user|
        self.create_or_update(new_user, auth_info)
      end
    else
      if user.last_updated <= auth_info.extra.raw_info.updated_at
        user
      else
        self.create_or_update(user, auth_info)
        user.save!
      end
    end
  end

  def self.create_or_update(user_type, auth_info)
    user_type.uid                = auth_info.uid
    user_type.name               = auth_info.extra.raw_info.name
    user_type.username           = auth_info.extra.raw_info.login
    user_type.avatar             = auth_info.extra.raw_info.avatar_url
    user_type.followers          = auth_info.extra.raw_info.followers
    user_type.following          = auth_info.extra.raw_info.following
    user_type.public_repos       = auth_info.extra.raw_info.public_repos
    user_type.company            = auth_info.extra.raw_info.company
    user_type.location           = auth_info.extra.raw_info.location
    user_type.bio                = auth_info.extra.raw_info.bio
    user_type.email              = auth_info.extra.raw_info.email
    user_type.last_updated       = auth_info.extra.raw_info.updated_at
    user_type.token              = auth_info.credentials.token
  end

end
