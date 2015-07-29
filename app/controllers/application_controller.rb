class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #すべてのヘルパーはビューで使用できますが、コントローラでは使用可能になっていません。
  #Sessionsヘルパーはビューとコントローラの両方でメソッドが必要となるので、コントローラでは上のように明示的にインクルードする必要があります。
  include SessionsHelper
end
