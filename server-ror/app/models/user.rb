class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # callback, after the insertion of the user in the database,
  # we create the role depending on the user's id in the database
  # cf BarTendr's documentation
  after_save {
    if self.id == 1
      # first user created: we give him admin rights
      self.add_role :admin
    elsif self.id == 2
      # second user created: we give him bartender rights
      self.add_role :bartender
    else
      # default right: barman
      self.add_role :barman
    end
  }
end
