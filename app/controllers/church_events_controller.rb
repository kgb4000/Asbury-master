class ChurchEventsController < ApplicationController
  before_action :set_church_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  # GET /church_events
  # GET /church_events.json
  def index
    @church_events = ChurchEvent.all
  end

  # GET /church_events/1
  # GET /church_events/1.json
  def show
  end

  # GET /church_events/new
  def new
    @church_event = ChurchEvent.new
  end

  # GET /church_events/1/edit
  def edit
  end

  # POST /church_events
  # POST /church_events.json
  def create
    @church_event = ChurchEvent.new(church_event_params)

    respond_to do |format|
      if @church_event.save
        format.html { redirect_to @church_event, notice: 'Church event was successfully created.' }
        format.json { render :show, status: :created, location: @church_event }
      else
        format.html { render :new }
        format.json { render json: @church_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /church_events/1
  # PATCH/PUT /church_events/1.json
  def update
    respond_to do |format|
      if @church_event.update(church_event_params)
        format.html { redirect_to @church_event, notice: 'Church event was successfully updated.' }
        format.json { render :show, status: :ok, location: @church_event }
      else
        format.html { render :edit }
        format.json { render json: @church_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church_events/1
  # DELETE /church_events/1.json
  def destroy
    @church_event.destroy
    respond_to do |format|
      format.html { redirect_to church_events_url, notice: 'Church event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church_event
      @church_event = ChurchEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def church_event_params
      params.require(:church_event).permit(:event_date, :event_name, :event_description, :event_time, :event_location)
    end
end
