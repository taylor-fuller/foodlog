class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    redirect_to diary_path
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @entry = Entry.new
    @previous_date = (date - 1.day).strftime('%F')
    @date = date.strftime('%F')
    @next_date = (date + 1.day).strftime('%F')
  end

  # GET /entries/1/edit
  def edit
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @date = date.strftime('%F')
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
    @date = entry_params['diary_date']

    respond_to do |format|
      if @entry.save
        format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    @date = entry_params['diary_date']
    
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @date = date.strftime('%F')

    @entry.destroy
    respond_to do |format|
      format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:meal_type, :diary_date)
    end
end
