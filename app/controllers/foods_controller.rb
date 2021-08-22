class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show
    redirect_to root_path
  end

  # GET /foods/new
  def new
    @entry_id = params[:entry_id]
    @food = current_user.foods.build
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @date = date.strftime('%F')
  end

  # GET /foods/1/edit
  def edit
    @entry_id = params[:entry_id]
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @date = date.strftime('%F')
  end

  # POST /foods or /foods.json
  def create
    @entry_id = params[:entry_id]
    @food = current_user.foods.build(food_params)
    @date = Date.parse(Time.parse(params[:date]).utc.to_s)

    respond_to do |format|
      if @food.save
        format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :action => "new", :entry_id => @entry_id }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    @entry_id = params[:entry_id]
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :action => "new", :entry_id => @entry_id }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    date = Date.parse(Time.parse(params[:date]).utc.to_s)
    @date = date.strftime('%F')

    @food.destroy
    respond_to do |format|
      format.html { redirect_to diary_path(@diary, :date => @date.to_s), notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @food = current_user.foods.find_by(id: params[:id])
    redirect_to root_path, alert: "You are not authorized for this action" if @food.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:title, :calories, :proteins, :carbohydrates, :fats, :entry_id, :user_id)
    end
end
