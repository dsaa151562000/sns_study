class TsubyakisController < ApplicationController

before_action :signed_in_user, only: [:create, :destroy]
 
  def index

  end


  def create
  #buildでオブジェクト化
  @tsubyaki = current_user.tsubyakis.build(tsubyaki_params)
  #@tsubyaki.save
  #redirect_to snsstudies_path
  @user2 = Snsstudy.find(params[:snsstudy][:id])

  if @tsubyaki.save
      flash[:success] = "つぶやきが投稿されました"
      redirect_to @user2
  else
    flash[:error] = "何かつぶやいてください！"
    redirect_to @user2
  end

  end


  def destroy

  end

private

    def tsubyaki_params
      params.require(:tsubyaki).permit(:content)
    end

end
