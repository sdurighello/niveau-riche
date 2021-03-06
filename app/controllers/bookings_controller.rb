class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
      @bookings = Booking.all
  end

  # POST /bookings/summary
  def summary
    submarine = Submarine.find(params[:submarine_id])
    start_at = params[:start_at].to_date
    end_at = params[:end_at].to_date
    @booking = Booking.new(
    submarine_id: submarine.id,
    start_at: start_at,
    end_at: end_at,
    total_price: submarine.price_day * (end_at - start_at).to_i
    )
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  def user
    @user = User.find(params[:user_id])
    @bookings = Booking.where(user: @user).order(start_at: :desc)
  end

  # POST /bookings
  # POST /bookings.json
  def create
    if current_user
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      respond_to do |format|
        if @booking.save
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_user_session_path
    end

  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:submarine_id, :start_at, :end_at, :total_price)
    end
end
