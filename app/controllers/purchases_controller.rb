class PurchasesController < ApplicationController
  def mine
    if current_mystic
      @products = Product.active.select { |product| current_mystic.has_access_to_product? product }
    else
      @products = []
    end
    render :json => @products.map(&:id)
  end
  
  def new
  end

  def create
    @product = Product.find params[:product_id]
    
    # Amount in cents
    @amount = @product.current_price_in_cents

    customer = Stripe::Customer.create(
      :email => current_mystic.email,
      :card  => params[:stripeToken]
    )
    
    current_mystic.update_attribute :stripe_id, customer.id

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "#{current_mystic.email} purchase of #{@product.name}",
      :currency    => 'usd'
    )
    
    if charge.paid
      Purchase.create :mystic => current_mystic, :product => @product, :price => @product.current_price
      
      @product.meditations.each do |meditation|
        current_mystic.accesses.create :meditation => meditation
      end
    end

    render :nothing => true

  rescue Stripe::CardError => e
    Rails.logger.error e.message
  end
end
