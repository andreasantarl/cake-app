class CakesController < ApplicationController
  before_action :set_cake, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  protect_from_forgery prepend: true

  # GET /cakes
  # GET /cakes.json
  def index
    @cakes = Cake.where(show_on_homepage: true).order(:position)
  end

  # GET /cakes/1
  # GET /cakes/1.json
  def show
    @cake = Cake.find(params[:id])
    @related_cakes = Cake.where(theme: @cake[:theme]).where.not(id: params[:id]).order("RANDOM()").limit(3)
    @comments = @cake.comments.all
    @comment = @cake.comments.new
  end

  # GET /cakes/new
  def new
    @cake = Cake.new
    @comment = Comment.new
  end

  # GET /cakes/search
  def search
    @cakes = Cake.search(params[:q], fields: [:title], match: :word_middle)
  end

  # POST /cakes
  # POST /cakes.json
  def create
    @cake = Cake.new(cake_params)

    respond_to do |format|
      if @cake.save
        format.html { redirect_to @cake }
        format.json { render :show, status: :created, location: @cake }
      else
        format.html { render :new }
        format.json { render json: @cake.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /cakes/1
  # PATCH/PUT /cakes/1.json
  def update
    respond_to do |format|
      if @cake.update(cake_params)
        format.html { redirect_to @cake, notice: 'Updated!' }
        format.json { render :show, status: :ok, location: @cake }
      else
        format.html { render :edit }
        format.json { render json: @cake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cakes/1
  # DELETE /cakes/1.json
  def destroy
    @cake.destroy

    respond_to do |format|
      format.html { redirect_to cakes_url, notice: 'Cake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake
      @cake = Cake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cake_params
      params.require(:cake).permit(:q, :title, :description, :price, :show_on_homepage, :theme, :image, :image_cache)
    end
end
