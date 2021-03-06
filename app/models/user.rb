class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation,
      :remember_me, :provider, :uid, :time_zone, :is_guest

  has_many :tasks, dependent: :destroy

  include ActiveRecordHelpers
end

