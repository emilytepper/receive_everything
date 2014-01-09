class MysticsController < ApplicationController
  before_action :set_mystic, only: [:show, :edit, :update, :destroy]

  # GET /mystics
  # GET /mystics.json
  def index
    @mystics = Mystic.all
  end

  # GET /mystics/1
  # GET /mystics/1.json
  def show
  end

  # GET /mystics/1/edit
  def edit
  end

  # PATCH/PUT /mystics/1
  # PATCH/PUT /mystics/1.json
  def update
    respond_to do |format|
      if @mystic.update(mystic_params)
        format.html { redirect_to @mystic, notice: 'Mystic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mystic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mystics/1
  # DELETE /mystics/1.json
  def destroy
    @mystic.destroy
    respond_to do |format|
      format.html { redirect_to mystics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mystic
      @mystic = Mystic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mystic_params
      params[:mystic]
    end
end
