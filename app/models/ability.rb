class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
      if user.nil?
        # if no user logged in, use a dummy user, see later
        user = User.new
      end
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :landlord
        # landlord can see all apartment listings
        can :read, Apartment
        #landlord can manage all apartments which they have created
        can :manage, Apartment, user_id: user_id
      else
        #renters can view apartment listings made by any user
        can :read, Apartment
      end
    end
  end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
