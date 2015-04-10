class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_relationships,  class_name: :Relationship,
           foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: :Relationship,
           foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :book_requests, dependent: :destroy

  enum role: [ :admin, :member ]

  before_validation :normalize_attributes
  validates :role, inclusion: {in: User.roles.keys}
  
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

  private
  def normalize_attributes
    self.role ||= :member
  end
end
