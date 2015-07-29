# Preview all emails at http://localhost:3000/rails/mailers/woodlock_welcome
class WoodlockWelcomePreview < ActionMailer::Preview
  def omniauth_welcome
    WoodlockWelcome.omniauth_welcome
  end
end
