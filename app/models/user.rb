class User < ActiveRecord::Base
  @@ROLE = {0 => :admin, nil => :member}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :role, -> r {where(role: @@ROLE.key(r))}

  def admin?
    @@ROLE[self.role] == :admin
  end

  def role_name
    @@ROLE[self.role]
  end
end
