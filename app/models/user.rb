class User < ApplicationRecord
	#アドレスを小文字に変換＝＞一意性保証
	before_save{ self.email = email.downcase}
	validates :name, presence:true, length:{ maximum: 50}
	#正規表現定数
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	#定数のformatに該当するもののみOK
	validates :email, presence:true, length:{ maximum: 255},
	format:{ with: VALID_EMAIL_REGEX },
	#メールの重複NG
	uniqueness: { case_sensitive: false }
	#セキュアパスワードの設定
	has_secure_password
	#パスワード　存在、６文字以上
	validates :password, presence:true, length:{ minimum: 6}

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                              BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
