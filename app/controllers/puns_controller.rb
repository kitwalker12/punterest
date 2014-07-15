class PunsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_pun, only: [:show, :edit, :update, :destroy]

  # GET /puns
  # GET /puns.json
  def index
    @puns = Pun.all
  end

  # GET /puns/1
  # GET /puns/1.json
  def show
  end

  # GET /puns/new
  def new
    @pun = Pun.new
  end

  # GET /puns/1/edit
  def edit
  end

  # POST /puns
  # POST /puns.json
  def create
    @pun = Pun.new(pun_params)
    @pun.user = current_user

    respond_to do |format|
      if @pun.save
        format.html { redirect_to @pun, notice: 'Pun was successfully created.' }
        format.json { render :show, status: :created, location: @pun }
      else
        format.html { render :new }
        format.json { render json: @pun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puns/1
  # PATCH/PUT /puns/1.json
  def update
    respond_to do |format|
      if @pun.update(pun_params)
        format.html { redirect_to @pun, notice: 'Pun was successfully updated.' }
        format.json { render :show, status: :ok, location: @pun }
      else
        format.html { render :edit }
        format.json { render json: @pun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puns/1
  # DELETE /puns/1.json
  def destroy
    @pun.destroy
    respond_to do |format|
      format.html { redirect_to puns_url, notice: 'Pun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pun
      @pun = Pun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pun_params
      params.require(:pun).permit(:body, :user_id)
    end
end
