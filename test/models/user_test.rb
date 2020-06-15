require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup  
		@user = User.new(name:"Example User", email:"user@example.com",
		password:"foobar", password_confirmation:"foobar")  #passwordとpassword確認の値追加
	end

	test "should be valid" do
		assert @user.valid?
	end

	#name空白NG
	test "name should be present" do
		@user.name = " "
		assert_not @user.valid?
	end

	#email空白NG
	test "email should be present" do
		@user.email = " "
		assert_not @user.valid?
	end

	#name長さ制限
	test "name should not be too long" do
		@user.name = "a"*51
		assert_not @user.valid?
	end

	#email長さ制限
	test "email should not be too long" do
		@user.email = "a"*244 + "@example.com"
		assert_not @user.valid?
	end

	#有効なアドレスの指定
	test "email validation should accept valid addresses" do
		valid_addresses = %w[user@example.com User@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.en]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	#無効なアドレスの指定
	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	#メールの重複NG (dupメソッド：同じ属性のデータ複製する)
	test "email addresses should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase  #アドレスを大文字に変換して代入
		@user.save
		assert_not duplicate_user.valid?
	end

	#アドレスを小文字変換してるか
	test "email addresses shoud be save as lower-case" do
		mixed_case_email = "Foo@ExAMPle.Com"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	#パスワードの最小文字数制限
	test "password should be present(nonblank)" do
		@user.password = @user.password_confirmation = ""*6
		assert_not @user.valid?
	end

	#最大文字数制限 6文字以上
	test "password should have a minimum length" do
		@user.password = @user.password_confirmation = "a"*5
		assert_not @user.valid?
	end

  # test "the truth" do
  #   assert true
  # end
end
