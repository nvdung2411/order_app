class User < ApplicationRecord
  enum role: { user: 0, admin: 1}
  has_many :order_items
  has_many :orders
  has_many :notifications
  has_many :reviews, dependent: :destroy

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable

  # Ex:- scope :active, -> {where(:active => true)}
end
