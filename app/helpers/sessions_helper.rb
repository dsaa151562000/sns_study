module SessionsHelper
 def sign_in(user)
 	#SecureRandom.urlsafe_base64で生成
    remember_token = Snsstudy.new_remember_token
    #クライアントのcookieへ保存　無期限に
    cookies.permanent[:remember_token] = remember_token
    #Digest::SHA1で暗号化　DBへ
    user.update_attribute(:remember_token, Snsstudy.encrypt(remember_token))
    #selfを付けるとこのクラス内のcurrent_user=(user)メソッドであることを明示
    self.current_user = user
 end

 #サインインしていたら　current_userがnilでなければ　true of falseを返す
def signed_in?
   !current_user.nil?
end


 #setter的な... current_userにuserを代入
 def current_user=(user)
    @current_user = user
 end

 #getter的な
 def current_user
    #cookiesのremember_token文字列をencryptしremember_tokenへ代入
    remember_token = Snsstudy.encrypt(cookies[:remember_token])
    #remember_tokenと一致したユーザーがいたら@current_userへ代入　定義されていればそのまま。　定義されていなければ左辺を代入
    @current_user ||= Snsstudy.find_by(remember_token: remember_token)
 end

 #このuserはcurrent_user?　true of falseを返す
 def current_user?(user)
    user == current_user
 end

 #current_userの
 def sign_out
    current_user.update_attribute(:remember_token,Snsstudy.encrypt(Snsstudy.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
 end
end