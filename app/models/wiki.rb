class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((public == false) || (public == nil))  }


   
  def collaborator_for(user)
    collaborators.where(user: user).first
  end
  
#  scope :visible_to, -> (user) { user ? all : where(public: true) }
  
  # scope :publics { where(public: true) }
  # scope :privates { where( public: false )}
end
