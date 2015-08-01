class SnsstudiesController < ApplicationController
  before_action :set_snsstudy, only: [:show, :edit, :update, :destroy]

  # GET /snsstudies
  # GET /snsstudies.json
  def index
    @snsstudies = Snsstudy.all
  end

  # GET /snsstudies/1
  # GET /snsstudies/1.json
  def show
  @snsstudies = Snsstudy.all
  @relation=Relationship.all
  end

  # GET /snsstudies/new
  def new
   @snsstudy = Snsstudy.new
   
  end

  # GET /snsstudies/1/edit
  def edit
  end

  # POST /snsstudies
  # POST /snsstudies.json
  def create
    @snsstudy = Snsstudy.new(snsstudy_params)

    respond_to do |format|
      if @snsstudy.save
        #sign_in(user)　引数に現在の@snsstudy  新しいユーザーを作成したらセッションも作成
        sign_in @snsstudy
        flash[:success] = "Welcome to the Sample App!"
        
        format.html { redirect_to @snsstudy, notice: 'Snsstudy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @snsstudy }
      else
        format.html { render action: 'new' }
        format.json { render json: @snsstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snsstudies/1
  # PATCH/PUT /snsstudies/1.json
  def update
    respond_to do |format|
      if @snsstudy.update(snsstudy_params)
        format.html { redirect_to @snsstudy, notice: 'Snsstudy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @snsstudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snsstudies/1
  # DELETE /snsstudies/1.json
  def destroy
    @snsstudy.destroy
    respond_to do |format|
      format.html { redirect_to snsstudies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snsstudy
      @snsstudy = Snsstudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snsstudy_params
      #params.require(:snsstudy).permit(:name, :introduction)
      params.require(:snsstudy).permit(:name, :introduction, :email, :password, :password_confirmation)
    end
end
