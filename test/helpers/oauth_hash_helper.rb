def github_omniauth_hash_mock(name: "Miguel Regedor", email: "mr@regedor.com", nickname: "regedor")
  {
    "provider" => "github",
    "uid"      => "12345",
    "info"     =>
      {
        "name"     => name,
        "email"    => email,
        "nickname" => nickname,
        "image"    => "https://avatars0.githubusercontent.com/u/test_path"
      }
  }
end

def facebook_omniauth_hash_mock(
  name: "Miguel Regedor",
  email: "mr@regedor.com",
  first_name: "Miguel",
  last_name: "Regedor"
)
  {
    "provider" => "facebook",
    "uid"      => "12345",
    "info"     =>
      {
        "name"       => name,
        "first_name" => first_name,
        "last_name"  => last_name,
        "email"      => email,
        "image"      => "http://graph.facebook.com/v2.6/test_path"
      },
    "extra"    =>
      {
        "raw_info"   =>
          {
            "gender" => "male"
          }
      }
  }
end

def google_omniauth_hash_mock(
  name: "Miguel Regedor",
  email: "mr@regedor.com",
  first_name: "Miguel",
  last_name: "Regedor"
)
  {
    "provider" => "google_oauth2",
    "uid"      => "12345",
    "info"     =>
      {
        "name"       => name,
        "first_name" => first_name,
        "last_name"  => last_name,
        "email"      => email,
        "image"      => "https://lh4.googleusercontent.com/test_path"
      }
  }
end
