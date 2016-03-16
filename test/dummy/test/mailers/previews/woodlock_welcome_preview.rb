class WoodlockWelcomePreview < ActionMailer::Preview
  def welcome
    WoodlockWelcomeMailer.omniauth_welcome(User.first, 'facebook')
  end
end
