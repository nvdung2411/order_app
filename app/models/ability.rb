# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all

    return if user.blank?

    can :read, Item, user_id: user.id
    can :manage, :all if user.admin?
  end
end
