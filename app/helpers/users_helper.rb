module UsersHelper
	#引数で与えられたユーザーのGRAVATAR画像を返す
	def gravatar_for(user,size: 80)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, atl:user.name, class:"gravatar")
	end
end
