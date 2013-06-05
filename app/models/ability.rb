class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :admin
      can :manage, User
    else
      can :read, :all
    end
  end
end
