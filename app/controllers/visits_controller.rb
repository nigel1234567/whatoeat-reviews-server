class VisitsController < ApplicationController
  before_action :set_visit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /visits or /visits.json
  def index
    @place = Place.all
    @visits = Visit.all
  end

  # GET /visits/1 or /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = current_user.visits.build
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits or /visits.json
  def create
    def find_place(name)
      Place.find_by(name)
    end

    # If Place does not exist in database, create it
    if find_place(name: visit_params[:name]).nil?
      Place.create(name: visit_params[:name], description: visit_params[:description], location: visit_params[:location])
    end

    # Create Place Id
    place_id = find_place(name: visit_params[:name]).id
    
    @visit = current_user.visits.build(place_id: place_id, name: visit_params[:name], description: visit_params[:description], location: visit_params[:location], date: visit_params[:date], time: visit_params[:time])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully created." }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1 or /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully updated." }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1 or /visits/1.json
  def destroy
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url, notice: "Visit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:name, :description, :location, :date, :time, :user_id, :place_id)
    end
end
