require 'test_helper'

class RegisterUserWithSiteFlowTest < ActionDispatch::IntegrationTest

  test 'should sign in an existing user' do
    visit new_user_session_path
    fill_in 'user_email', with: 'miguelregedor@mail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert page.has_content? 'Sign out'
  end

  test 'should deny sign in with wrong credentials' do
    visit new_user_session_path
    fill_in 'user_email', with: 'miguelfernandes@mail.com'
    fill_in 'user_password', with: 'wrong_password'
    click_button 'Sign in'
    assert page.has_content? 'Invalid email or password'
    fill_in 'user_email', with: 'wrong_email@mail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert page.has_content? 'Invalid email address or password'
  end

  test 'should deny login without confirmation' do
    visit new_user_registration_path
    assert page.has_content? 'Sign up with site'
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Doe'
    fill_in 'user_email', with: 'johndoe@mail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    assert page.has_content? 'Sign in with site'
    fill_in 'user_email', with: 'johndoe@mail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert page.has_content? 'You have to confirm your email address before continuing'
    assert page.has_content? 'Sign in with site'
  end

  test 'should sign in a new user after confirming registration via email' do
    clear_emails
    visit new_user_registration_path
    assert page.has_content? 'Sign up with site'
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Doe'
    fill_in 'user_email', with: 'johndoe@mail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    assert page.has_content? 'Sign in with site'
    open_email('johndoe@mail.com')
    current_email.click_link 'Confirm my account'
    visit new_user_session_path
    fill_in 'user_email', with: 'johndoe@mail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert page.has_content? 'Sign out'
  end
  
end
