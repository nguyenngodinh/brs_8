class User < ActiveRecord::Base
  
  @@ROLE = {0 => :admin, nil => :member}
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :role, -> r {where(role: @@ROLE.key(r))}
  
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :followers, through: :passive_relationships, source: :follower
  
  def admin?
    @@ROLE[self.role] == :admin
  end

  def role_name
    @@ROLE[self.role]
  end
  
  def follow(other_user)
    active_relationships.create followed_id: other_user.id
  end

  def unfollow(other_user)
    active_relationship = active_relationships.find_by followed_id: other_user.id
    active_relationship.destroy
  end

  def following?(other_user)
    following.include? other_user
  end

end
