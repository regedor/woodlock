class Woodlock::OauthParser
  attr_reader :auth

  def initialize(auth)
    @auth = auth
  end

  def provider
    auth["provider"]
  end

  def email
    auth["info"]["email"]
  end

  def first_name
    auth["info"]["first_name"] || auth_info_name_partial(:first_name)
  end

  def last_name
    auth["info"]["last_name"] || auth_info_name_partial(:last_name)
  end

  def image
    auth["info"]["image"]
  end

  def gender
    auth["extra"]["raw_info"]["gender"]
  end

  def github_username
    auth["info"]["nickname"]
  end

  private

  def auth_info_name_partial(which_name)
    auth_name = auth["info"]["name"]
    return unless auth_name
    case which_name
    when :first_name
      auth_name.gsub(/\s+/m, " ").strip.split(" ")[0]
    when :last_name
      auth_name.gsub(/\s+/m, " ").strip.split(" ")[-1]
    end
  end
end
