require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	#ユーザーログインテスト
	def setup
		@user = users(:michael)
	end

	test "login with invalid information" do
		get login_path  #loginパスの確認
		# assert_template 'sessions/new'#viewの確認
		post login_path, params: { session: {email: @user.email,password:'password'}}

		assert is_logged_in?

		#リダイレクト先の確認
		assert_redirected_to @user
		follow_redirect!

		# assert_template 'sessions/new' #遷移とメッセージの確認
		assert_template'users/show'
		#ログイン用リンクがないこと確認
		assert_select"a[href=?]",login_path,count:0
		assert_select"a[href=?]",logout_path
		assert_select"a[href=?]",user_path(@user)
		# assert_not flash.empty?
		# get root_path  #homeに移動
		# assert flash.empty? #メッセージがないことを確認

		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url
		follow_redirect!
		assert_select"a[href=?]",login_path
		assert_select"a[href=?]",logout_path, count: ()
		assert_select"a[href=?]",user_path(@user), count: ()
	end

  # test "the truth" do
  #   assert true
  # end
end
