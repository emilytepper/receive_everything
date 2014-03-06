class GoddessesController < ApplicationController
  before_action :set_goddess, only: [:show, :edit, :update, :destroy]

  # GET /goddesses
  # GET /goddesses.json
  def index
    @goddesses = Goddess.all
  end

  # GET /goddesses/1
  # GET /goddesses/1.json
  def show
  end

  # GET /goddesses/new
  def new
    @goddess = Goddess.new
  end

  # GET /goddesses/1/edit
  def edit
  end

  # POST /goddesses
  # POST /goddesses.json
  def create
    @goddess = Goddess.new(goddess_params)
    @goddess.mystic = current_mystic
    
    # stripe_customer = Stripe::Customer.create current_mystic.stripe_id
    
    if @goddess.group_choice == 'In-Person'
      @plan = 'Receptivity Goddess Group In-Person 2014'
      @meeting_time = "April 6th from 7-9PM"
    else
      @plan = 'Receptivity Goddess Group Online 2014'
      @meeting_time = "April 3rd from 1-3PM"
    end
    
    @subscription_customer = Stripe::Customer.create(:card => params[:stripe_token], :plan => @plan, :email => @goddess.email)

    unless current_mystic.stripe_id.present?
      current_mystic.update_attribute :stripe_id, @subscription_customer.id
    end

    respond_to do |format|
      if @goddess.save
        format.html { redirect_to @goddess, notice: "I'm honored to have you in the group, #{@goddess.first_name}.  Our first meeting is #{@meeting_time}.  We'll send you an email reminder before the meeting." }
        format.json { render action: 'show', status: :created, location: @goddess }
      else
        format.html { render action: 'new' }
        format.json { render json: @goddess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goddesses/1
  # PATCH/PUT /goddesses/1.json
  def update
    respond_to do |format|
      if @goddess.update(goddess_params)
        format.html { redirect_to @goddess, notice: 'Goddess was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goddess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goddesses/1
  # DELETE /goddesses/1.json
  def destroy
    @goddess.destroy
    respond_to do |format|
      format.html { redirect_to goddesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goddess
      @goddess = Goddess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goddess_params
      params.require(:goddess).permit(:first_name, :last_name, :email, :personal_statement, :mystic_id, :group_choice)
    end
end
