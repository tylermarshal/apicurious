class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.username           = auth_info.extra.raw_info.username
      new_user.company            = auth_info.extra.raw_info.company
      new_user.bio                = auth_info.extra.raw_info.bio
      new_user.email              = auth_info.extra.raw_info.email
      new_user.token              = auth_info.credentials.token
    end
  end

end
