class ChargesController < ApplicationController
  include ChargesHelper

  def create
  # Creates a Stripe Customer object, for associating with the charge
  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )

  # Where the real magic happens
  charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: amount_default,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
  )

  flash[:notice] = "Thank you for upgrading, #{current_user.email} to Premium. You can now create private wikis!"
  redirect_to new_wiki_path

  current_user.update_role
  #Charge.create(premium_paid: true)

  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.username}",
      amount: amount_default
    }
  end

end
