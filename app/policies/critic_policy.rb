class CriticPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user:).or(scope.where(approved: true))
      end
    end
  end

  def create?
    true
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? || record.user == user
  end
end
