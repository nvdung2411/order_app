# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all

    return if user.blank?

    can :manage, :all if user.admin?
  end
end
