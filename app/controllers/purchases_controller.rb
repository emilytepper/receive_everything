class PurchasesController < ApplicationController
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
      @product.meditations.each do |meditation|
        current_mystic.accesses.create :meditation => meditation
      end
    end

    redirect_to root_url

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_url
  end
end
