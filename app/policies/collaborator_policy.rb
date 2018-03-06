class CollaboratorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.collaborators
    end
  end

  def count?
    true
  end

  def import?
    true
  end

end
