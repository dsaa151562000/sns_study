class RelationshipsController < ApplicationController

  def create
    #@user2 = Snsstudy.find(params[:snsstudy][:id])
  	@user = Snsstudy.find(params[:relationship][:followed_id])
   @post = Relationship.new(relationships_params)
    @post.save
    #redirect_to @post

    #@snsstudy = Snsstudy.new(snsstudy_params)
    #@user2= params.require(:snsstudy).permit(:id)
  	#@user2 = Snsstudy.find(params[:id])
    

    #@snsstudy.follow!(@user)
  	redirect_to @user
  end


  def destroy
    @user = Relationship.find(params[:id]).followed
    @current_user.unfollow!(@user)
    redirect_to @user
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