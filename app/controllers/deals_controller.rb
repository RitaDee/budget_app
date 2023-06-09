class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]

  # GET /deals or /deals.json
  def index
    @category = Category.find(params[:category_id])
    # @deals = Deal.all
    @deal_category = DealCategory.all
    @deals = @category.deals.order(created_at: :desc)
    # @deals = DealCategory.includes(:deal).where(category_id: @category.id)
  end

  # GET /deals/1 or /deals/1.json
  def show; end

  # GET /deals/new
  def new
    @category = Category.find(params[:category_id])
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals or /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_user
    category_id = params[:category_id]
    puts category_id

    respond_to do |format|
      if @deal.save
        DealCategory.create(deal_id: @deal.id, category_id: category_id)
        format.html { redirect_to category_deals_path, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1 or /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to deal_url(@deal), notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
