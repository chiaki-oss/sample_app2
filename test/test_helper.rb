ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'  #結果に色つけ
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  #ユーザーのログイン状態を確認
  def is_logged_in?
  	!session[:user_id].nil?
  end

  # Add more helper methods to be used by all tests here...
end
