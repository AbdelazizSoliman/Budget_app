class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_purchase, only: %i[show edit update destroy]
  
    # GET /purchases or /purchases.json
    def index
      @purchases = Purchase.all
    end
  
    # GET /purchases/1 or /purchases/1.json
    def show; end
  
    # GET /purchases/new
    def new
      @attributes = []
      @purchase = Purchase.new
      @attributes << @purchase
      @categories = current_user.categories
      @attributes << @categories
    end
  
    # GET /purchases/1/edit
    def edit
    end
  
    # POST /purchases or /purchases.json
    def create
      @attributes = []
      @purchase = Purchase.new(purchase_params)
      @purchase.author = current_user
      category_id = params[:purchase][:category_id]
      if category_id.present?
        category = Category.find(category_id)
        @purchase.categories << category
      end
      @attributes << @purchase
      @categories = current_user.categories
      @attributes << @categories
  
      respond_to do |format|
        if @purchase.save
          format.html { redirect_to category_url(@purchase.categories[0]), notice: 'Purchase was successfully created.' }
          format.json { render :show, status: :created, location: @purchase }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /purchases/1 or /purchases/1.json
    def update
    end
  
    # DELETE /purchases/1 or /purchases/1.json
    def destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:name, :amount)
    end
end
