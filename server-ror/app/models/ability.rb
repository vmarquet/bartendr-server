class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new   # guest user (not logged in) = client qui utilise l'application

    if user.has_role? :admin
        can :manage, :all

    elsif user.has_role? :bartender
        can :manage, :articles
        can :read, [:orders, :items]
    
    elsif user.has_role? :barman
        can :update, :articles  # TODO: il faut l'accès en écriture uniquement sur le tag "en stock"
        can :read, [:orders, :items]
        can :destroy, [:orders, :items]  # au cas où un client annule sa commande
        # (TODO: autoriser uniquement dans l'heure suivant la commande)
    
    else  # client qui utilise l'application
        can :read, :articles
        can :create, :orders
    end

    # Arguments for `can`:
    # 1st argument: action allowed: :read, :create, :update, :destroy, :all
    # 2nd argument: resource to perform the action on (model class)
    # 3d argument: optional hash of conditions to further filter the objects

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
