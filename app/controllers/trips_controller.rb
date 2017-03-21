class TripsController < ApplicationController
  before_filter :authorize
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  autocomplete :trip, :place
  autocomplete :trip, :car

  # GET /trips
  # GET /trips.json
  def index
    if params[:userid]
      @trips = Trip.order('trips.depdate DESC').all.paginate(:page => params[:page], per_page: 12).where("creator=#{params[:userid]}")
    else
      @trips = Trip.order('trips.depdate DESC').all.paginate(:page => params[:page], per_page: 12)
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.creator = current_user.id
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, flash: {success: 'Trip was successfully created.' } }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    if current_user.id == @trip.creator
      respond_to do |format|
        if @trip.update(trip_params)
          format.html { redirect_to @trip, flash: { succes: 'Trip was successfully updated.' } }
          format.json { render :show, status: :ok, location: @trip }
        else
          format.html { render :edit }
          format.json { render json: @trip.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, flash: { danger: 'You do not have permission'}
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if current_user.id == @trip.creator
      @trip.destroy
      respond_to do |format|
        format.html { redirect_to trips_url, flash: { success: 'Trip was successfully destroyed.' } }
        format.json { head :no_content }
      end
    else
      redirect_to root_url, flash: { danger: 'You do not have permission'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:depdate, :place, :description, :phone, :capacity, :car)
    end
end
