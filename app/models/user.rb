class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :notifications, foreign_key: :recipient_id
  has_many :channel_users, dependent: :destroy
  has_many :channels, through: :channel_users

  has_many :messages, dependent: :destroy
end
