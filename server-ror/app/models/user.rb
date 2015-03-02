class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # we check that some fields aren't nil
  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, maximum: 255
  validates_length_of :last_name,  maximum: 255

  # callback, after the insertion of the user in the database,
  # we create the role depending on the user's id in the database
  # cf BarTendr's documentation
  after_create {
    if self.id == 1
      # first user created: we give him admin rights
      self.add_role :admin
      # and we approve him
      self.approved = true
      self.save
    elsif self.id == 2
      # second user created: we give him bartender rights
      self.add_role :bartender
      # and we approve him
      self.approved = true
      self.save
    else
      # we send the mail to the bartender(s) to ask them to approve the account
      AdminMailer.send_confirm_user_email self
    end
  }

  # stuff to deal with account activation by admin
  # cf https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
end
