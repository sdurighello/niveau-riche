class PortsController < ApplicationController
  before_action :set_port, only: [:show, :edit, :update, :destroy]

  # GET /ports
  # GET /ports.json
  def index
    @ports = Port.all
  end

  # GET /ports/1
  # GET /ports/1.json
  def show
  end

  # GET /ports/new
  def new
    @port = Port.new
  end

  # GET /ports/1/edit
  def edit
  end

  # POST /ports
  # POST /ports.json
  def create
    @port = Port.new(port_params)

    respond_to do |format|
      if @port.save
        format.html { redirect_to @port, notice: 'Port was successfully created.' }
        format.json { render :show, status: :created, location: @port }
      else
        format.html { render :new }
        format.json { render json: @port.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /ports/test_availability
  def available_submarines
    @port = Port.find(params[:port][:id])
    @desired_start_at = Date.civil(params[:desired_start_at][:year].to_i, params[:desired_start_at][:month].to_i, params[:desired_start_at][:day].to_i)
    @desired_end_at = Date.civil(params[:desired_end_at][:year].to_i, params[:desired_end_at][:month].to_i, params[:desired_end_at][:day].to_i)

    @submarines = @port.check_available_submarines(@port, @desired_start_at, @desired_end_at)
  end

  # PATCH/PUT /ports/1
  # PATCH/PUT /ports/1.json
  def update
    respond_to do |format|
      if @port.update(port_params)
        format.html { redirect_to @port, notice: 'Port was successfully updated.' }
        format.json { render :show, status: :ok, location: @port }
      else
        format.html { render :edit }
        format.json { render json: @port.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ports/1
  # DELETE /ports/1.json
  def destroy
    @port.destroy
    respond_to do |format|
      format.html { redirect_to ports_url, notice: 'Port was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port
      @port = Port.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def port_params
      params.require(:port).permit(:name, :description, :image_url)
    end
end
