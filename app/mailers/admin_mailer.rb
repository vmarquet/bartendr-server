class AdminMailer < ActionMailer::Base
  default from: 'automatic-mailer@bartendr.fr'
  layout 'mailer'  # found in app/views/layout/

  def send_confirm_user_email user
    @user = user  # the user that registered

    # we select only the "bartender" users
    active_record_users = User.all
    @bartenders = []
    for user in active_record_users
      if user.has_role? :bartender
        @bartenders << user
      end
    end

    # we send the email to all the "bartender" users
    for bartender in @bartenders
      mail(mailto: bartender.email, subject: 'An new barman registered, approve him ?').deliver!
    end
  end
end
