class TithesController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]

	def show 
	end

	def new
	end

	def create

		Stripe.api_key = ENV["STRIPE_SECRET"]

		# Amount in cents
    amount = params[:amount].to_f * 100
 
    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )
 
    # Create the charge using the customer data returned by Stripe API
    Stripe::Charge.create(
      customer: customer.id,
      amount: amount.to_i,
      description: 'Tithe to ABUMC',
      currency: 'usd'
    )

    # place more code upon successfully creating the charge
	  rescue Stripe::CardError => e
	    flash[:error] = e.message
	    redirect_to tithe_path
	    flash[:notice] = "Please try again"

	end

	def destroy
	end

	private

		def redirect_to_signup
			if !user_signed_in?
				session["user_return_to"] = new_tithe_path
				redirect_to new_user_registration_path
			end
		end

end
