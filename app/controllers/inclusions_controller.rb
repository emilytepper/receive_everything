class InclusionsController < ApplicationController
  before_action :set_inclusion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_creatrix!

  # GET /inclusions
  # GET /inclusions.json
  def index
    @inclusions = Inclusion.all
  end

  # GET /inclusions/1
  # GET /inclusions/1.json
  def show
  end

  # GET /inclusions/new
  def new
    @inclusion = Inclusion.new :product_id => params[:product_id]
  end

  # GET /inclusions/1/edit
  def edit
  end

  # POST /inclusions
  # POST /inclusions.json
  def create
    @inclusion = Inclusion.new(inclusion_params)

    respond_to do |format|
      if @inclusion.save
        format.html { redirect_to @inclusion, notice: 'Inclusion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inclusion }
      else
        format.html { render action: 'new' }
        format.json { render json: @inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inclusions/1
  # PATCH/PUT /inclusions/1.json
  def update
    respond_to do |format|
      if @inclusion.update(inclusion_params)
        format.html { redirect_to @inclusion, notice: 'Inclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inclusions/1
  # DELETE /inclusions/1.json
  def destroy
    @inclusion.destroy
    respond_to do |format|
      format.html { redirect_to inclusions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inclusion
      @inclusion = Inclusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inclusion_params
      params.require(:inclusion).permit(:product_id, :meditation_id)
    end
end
