class DealCategoriesController < ApplicationController
  before_action :set_deal_category, only: %i[show edit update destroy]

  # GET /deal_categories or /deal_categories.json
  def index
    @deal_categories = DealCategory.all
  end

  # GET /deal_categories/1 or /deal_categories/1.json
  def show; end

  # GET /deal_categories/new
  def new
    @deal_category = DealCategory.new
  end

  # GET /deal_categories/1/edit
  def edit; end

  # POST /deal_categories or /deal_categories.json
  def create
    @deal_category = DealCategory.new(deal_category_params)

    respond_to do |format|
      if @deal_category.save
        format.html { redirect_to deal_category_url(@deal_category), notice: 'Deal category was successfully created.' }
        format.json { render :show, status: :created, location: @deal_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deal_categories/1 or /deal_categories/1.json
  def update
    respond_to do |format|
      if @deal_category.update(deal_category_params)
        format.html { redirect_to deal_category_url(@deal_category), notice: 'Deal category was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deal_categories/1 or /deal_categories/1.json
  def destroy
    @deal_category.destroy

    respond_to do |format|
      format.html { redirect_to deal_categories_url, notice: 'Deal category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal_category
    @deal_category = DealCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_category_params
    params.require(:deal_category).permit(:category_id, :deal_id)
  end
end
