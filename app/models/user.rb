class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
    
    belongs_to :plan
    
    attr_accessor :stripe_card_token
    # If pro user passes validation (email, password and so on) then call Stripe API
    # and tell setup a subscription upon charging the customser's card
    # Stripe response back with customer data
    # Store customer.id as customer token
    def save_with_subscription
        if valid?
            customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
            self.stripe_customer_token = customer.id
            save!
        end
    end
end
