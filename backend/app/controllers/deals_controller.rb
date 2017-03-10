class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    start_time = DateTime.now.in_time_zone('Asia/Kolkata')
    start_time = start_time.change({ hour: 10, min: 0, sec: 0 })
    end_time = start_time + 1.day
    deal = @deals.where(publish_date: start_time..end_time)
    render :json => deal, status: :ok
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    start_time = deal_params[:publish_date].to_time.in_time_zone('Asia/Kolkata')
    start_time = start_time.change({ hour: 10, min: 0, sec: 0 })
    end_time = start_time + 1.day
    @deal.publish_date = start_time
    if Deal.where(publish_date: start_time..end_time).blank? and @deal.save
        render :json => @deal, :status => :created
    else
      render :json => @deal.errors, :status => :unprocessable_entity
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:title, :description, :price, :discounted_price, :quantity, :publish_date, :image_path, :string)
    end
end
