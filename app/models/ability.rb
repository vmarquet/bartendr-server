class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new   # guest user (not logged in) = client qui utilise l'application

    if user.has_role? :admin
        can :manage, :all

    elsif user.has_role? :bartender
        can :manage, [Article, Category]
        can :read, [Order, Item]
    
    elsif user.has_role? :barman
        can [:read, :update], Article
        # TODO: il faudrait l'accès en écriture uniquement sur le tag "en stock" des articles
        can :read, Category
        can :read, [Order, Item]
        can :destroy, [Order, Item]  # au cas où un client veut annuler sa commande
        # TODO: autoriser uniquement dans l'heure suivant la commande
    
    else  # client qui utilise l'application
        can :read, [Article, Category]
        can :create, [Order, Item]
    end

    # Arguments for `can`:
    # 1st argument: action allowed: :read, :create, :update, :destroy, :all
    # 2nd argument: resource to perform the action on (model class)
    # 3d argument: optional hash of conditions to further filter the objects

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
