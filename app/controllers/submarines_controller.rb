class SubmarinesController < ApplicationController
  before_action :set_submarine, only: [:show, :edit, :update, :destroy]

  # GET /submarines
  # GET /submarines.json
  def index
    @submarines = Submarine.all
  end

  # GET /submarines/1
  # GET /submarines/1.json
  def show
  end

  # GET /submarines/new
  def new
    @submarine = Submarine.new
  end

  # GET /submarines/1/edit
  def edit
  end

  # POST /submarines
  # POST /submarines.json
  def create
    @submarine = Submarine.new(submarine_params)
    @submarine.user = current_user
    respond_to do |format|
      if @submarine.save
        format.html { redirect_to @submarine, notice: 'Submarine was successfully created.' }
        format.json { render :show, status: :created, location: @submarine }
      else
        format.html { render :new }
        format.json { render json: @submarine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submarines/1
  # PATCH/PUT /submarines/1.json
  def update
    respond_to do |format|
      if @submarine.update(submarine_params)
        format.html { redirect_to @submarine, notice: 'Submarine was successfully updated.' }
        format.json { render :show, status: :ok, location: @submarine }
      else
        format.html { render :edit }
        format.json { render json: @submarine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submarines/1
  # DELETE /submarines/1.json
  def destroy
    @submarine.destroy
    respond_to do |format|
      format.html { redirect_to submarines_url, notice: 'Submarine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submarine
      @submarine = Submarine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submarine_params
      params.require(:submarine).permit(:name, :type_submarine, :price_day, :image_url, :description, :max_number_of_guests, :port_id, :user_id)
    end
end
