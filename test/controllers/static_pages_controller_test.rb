require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup  #各テスト実行前に実行される
  	@base_title ="Ruby on Rails Tutorial Sample App"  #基本タイトル設定
  end

  # titleとurlの確認
  test "should get home" do
    get root_path
    assert_response :success
    #title指定
    # assert_select "title", "Home|#{@base_title}"  #基本タイトル代入
    assert_select "title", "Ruby on Rails Tutorial Sample App"  #変更
  end

  # titleとurlの確認
  test "should get help" do
    get help_path
    assert_response :success
    # assert_select "title", "Help|#{@base_title}"
    assert_select "title", "Help|Ruby on Rails Tutorial Sample App"
  end

  # titleとurlの確認
  test "should get about" do
  	get about_path
  	assert_response :success
  	# assert_select "title", "About|#{@base_title}"
    assert_select "title", "About|Ruby on Rails Tutorial Sample App"
  end

  # titleとurlの確認
  test "should get contact" do
  	get contact_path
  	assert_response :success
  	# assert_select "title", "Contact|#{@base_title}"
    assert_select "title", "Contact|Ruby on Rails Tutorial Sample App"
  end

end
