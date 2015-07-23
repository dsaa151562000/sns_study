class RelationshipsController < ApplicationController

  def create
    @user2 = Snsstudy.find(params[:snsstudy][:id])

  	@user = Snsstudy.find(params[:relationship][:followed_id])

    @user2.follow!(@user)
  	redirect_to @user2
  end


  def destroy
    @user2 = Snsstudy.find(params[:snsstudy][:id])

    @user = Relationship.find(params[:id]).followed

    @user2.unfollow!(@user)

    redirect_to @user2
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snsstudy
      @snsstudy = Snsstudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snsstudy_params
      params.require(:snsstudy).permit(:id)
    end

    def relationships_params
     params.require(:relationships).permit(:follower_id, :followed_id)
    end
end