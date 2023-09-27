class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: %i[show edit update destroy]
  
    # GET /categories or /categories.json
    def index
      @categories = current_user.categories.includes(:purchases)
    end
  
    # GET /categories/1 or /categories/1.json
    def show
      @purchases = @category.purchases.order(created_at: :desc)
    end
  
    # GET /categories/new
    def new
      @category = Category.new
    end
  
    # GET /categories/1/edit
    def edit; end
  
    # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)
      @category.user = current_user
  
      respond_to do |format|
        if @category.save
          handle_uploaded_icon_file if category_params[:icon].present?
          format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def update
    end
  
    # DELETE /categories/1 or /categories/1.json
    def destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon)
    end
  
    # def handle_uploaded_icon_file
    #     uploaded_file = params[:category][:icon]
      
    #     if uploaded_file.present?
    #       # Specify the directory where you want to save the uploaded files
    #       upload_dir = Rails.root.join('public', 'uploads')
    #       FileUtils.mkdir_p(upload_dir) unless File.directory?(upload_dir)
      
    #       file_path = File.join(upload_dir, uploaded_file.original_filename)
      
    #       File.binwrite(file_path, uploaded_file.read)
      
    #       @category.update(icon: File.join('/uploads', uploaded_file.original_filename))
    #     end
    # end

    def handle_uploaded_icon_file
        uploaded_file = category_params[:icon]
        file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
    
        File.binwrite(file_path, uploaded_file.read)
    
        @category.update(icon: File.join('/uploads', uploaded_file.original_filename))
      end
end
