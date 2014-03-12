class ShareLinksController < ApplicationController
  before_action :set_share_link, only: [:sharer, :show, :edit, :update, :destroy]
  before_action :authenticate_creatrix!, except: :sharer

  def sharer
    
  end

  # GET /share_links
  # GET /share_links.json
  def index
    @share_links = ShareLink.all
  end

  # GET /share_links/1
  # GET /share_links/1.json
  def show
  end

  # GET /share_links/new
  def new
    @share_link = ShareLink.new
  end

  # GET /share_links/1/edit
  def edit
  end

  # POST /share_links
  # POST /share_links.json
  def create
    @share_link = ShareLink.new(share_link_params)

    respond_to do |format|
      if @share_link.save
        format.html { redirect_to @share_link, notice: 'Share link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @share_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @share_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_links/1
  # PATCH/PUT /share_links/1.json
  def update
    respond_to do |format|
      if @share_link.update(share_link_params)
        format.html { redirect_to @share_link, notice: 'Share link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @share_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_links/1
  # DELETE /share_links/1.json
  def destroy
    @share_link.destroy
    respond_to do |format|
      format.html { redirect_to share_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_link
      @share_link = ShareLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_link_params
      params.require(:share_link).permit(:url, :clicks, :shares, :creatrix_id, :description, :image)
    end
end
