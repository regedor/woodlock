require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest
  test 'should login to AA with right credentials' do
    visit new_admin_user_session_path
    assert page.has_content? 'Woodlock ActiveAdmin Login'
    fill_in 'admin_user_email', with: 'miguelregedor@mail.com'
    fill_in 'admin_user_password', with: 'password'
    click_button 'Login'
    assert page.has_content? 'Dashboard'
  end

  test 'should deny login to AA with wrong credentials' do
    visit new_admin_user_session_path
    assert page.has_content? 'Woodlock ActiveAdmin Login'
    click_button 'Login'
    assert page.has_content? 'Invalid email or password.'
    fill_in 'admin_user_email', with: 'miguelregedor@mail.com'
    fill_in 'admin_user_password', with: 'wrong_password'
    click_button 'Login'
    assert page.has_content? 'Invalid email or password.'
    fill_in 'admin_user_email', with: 'wrong_email@mail.com'
    fill_in 'admin_user_password', with: 'password'
    click_button 'Login'
    assert page.has_content? 'Invalid email address or password.'
  end
end
