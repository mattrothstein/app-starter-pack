class InviteMailer < Devise::Mailer

  def invitation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :invitation_instructions, opts)
  end

end
