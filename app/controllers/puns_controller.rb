class PunsController < ApplicationController

  before_filter :require_user_signed_in, only: [:edit, :update, :destroy, :vote]

  before_action :set_pun, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @puns = Pun.all
  end

  def show
  end

  def new
    @pun = Pun.new
  end

  def edit
  end

  def create
    @pun = Pun.new(pun_params)
    @pun.user = current_user if user_signed_in?

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

  def destroy
    @pun.destroy
    respond_to do |format|
      format.html { redirect_to puns_url, notice: 'Pun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def vote

    direction = params[:direction]

    raise "No direction parameter specified to #vote action." unless direction

    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @pun.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    def set_pun
      @pun = Pun.find(params[:id])
    end

    def pun_params
      params.require(:pun).permit(:body, :credit, :user_id)
    end
end
