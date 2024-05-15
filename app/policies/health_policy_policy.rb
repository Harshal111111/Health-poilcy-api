class HealthPolicyPolicy < ApplicationPolicy
    def create?
      user.admin? # Example: Only admins can create health policies
    end
  
    def update?
      user.admin? || record.user == user # Example: Admins or the owner of the policy can update it
    end
  
    def destroy?
      user.admin? || record.user == user # Example: Admins or the owner of the policy can delete it
    end
  
    def show?
      user.admin? || record.user == user # Example: Admins or the owner of the policy can view it
    end
  
    # Define other policy methods for different actions if needed
  end