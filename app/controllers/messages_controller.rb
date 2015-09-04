class MessagesController < ApplicationController

  def index

  end

  def show
   @snsstudy = Snsstudy.find(params[:id])
   @c_user=current_user
   #@mess = @snsstudy.messages.paginate(page: params[:page])
   #posts = Post.where("id = ? and title = ?", 2, 'title')
   #@mess = @snsstudy.messages.where(to_snsstudy_id:2)
   #@mess = current_user.messages.where("to_snsstudy_id = ?",@snsstudy)

   #@mess = current_user.messages.where("to_snsstudy_id = ?",@snsstudy)

   #@mess = Message.find_by_sql("SELECT snsstudies.id,snsstudies. name,messages.id,messages.messe,messages.snsstudy_id,messages.to_snsstudy_id,messages.created_at FROM snsstudies INNER JOIN messages ON snsstudies.id = messages.snsstudy_id WHERE (snsstudy_id = 1 OR snsstudy_id = 2) AND (to_snsstudy_id = 2 OR  to_snsstudy_id = 1) ORDER BY messages.created_at desc")

   @mess = Message.find_by_sql(["SELECT snsstudies.id,snsstudies. name,messages.id,messages.messe,messages.snsstudy_id,messages.to_snsstudy_id,messages.created_at FROM snsstudies INNER JOIN messages ON snsstudies.id = messages.snsstudy_id WHERE (snsstudy_id = ? OR snsstudy_id = ?) AND (to_snsstudy_id = ? OR  to_snsstudy_id = ?) ORDER BY messages.created_at desc",@c_user,@snsstudy,@snsstudy,@c_user])



  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
