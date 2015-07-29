module SessionsHelper
 def sign_in(user)
 	#SecureRandom.urlsafe_base64で生成
    remember_token = Snsstudy.new_remember_token
    #クライアントのcookieへ保存　無期限に
    cookies.permanent[:remember_token] = remember_token
    #Digest::SHA1で暗号化　DBへ
    user.update_attribute(:remember_token, Snsstudy.encrypt(remember_token))
    self.current_user = user
 end

  def current_user=(user)
    @current_user = user
  end

 def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
 end

end