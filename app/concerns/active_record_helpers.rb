module ActiveRecordHelpers

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def find_for_oauth(auth)
      record = where(provider: auth.provider, uid: auth.uid.to_s).first

      record || (
        if existing_user = where(email: auth.info.email).first
          existing_user.tap { |u| u.update_attributes(provider: auth.provider, uid: auth.uid) }
        else
          create(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20])
        end
      )
    end
  end
end

