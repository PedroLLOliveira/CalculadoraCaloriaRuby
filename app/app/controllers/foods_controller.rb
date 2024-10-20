class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy, :calculate_calories]
  skip_before_action :verify_authenticity_token, only: [:calculate_calories]

  def calculate_calories
    @food = Food.find(params[:id])
    quantity = params[:quantity].to_f
    @calories = @food.calculate_calories(quantity)
    
    respond_to do |format|
      format.html 
      format.json { render json: { calories: @calories } }
    end
  end

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  def new
    @food = Food.new
    @food_groups = FoodGroup.all
  end
  
  def edit
    @food_groups = FoodGroup.all
  end
  

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy!

    respond_to do |format|
      format.html { redirect_to foods_path, status: :see_other, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :protein, :lipid, :carbohydrate, :food_group_id)
    end
end
