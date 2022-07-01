class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    email
  end

  after_create do
    customer = Stripe::Customer.create(email: self.email)
    # Move this logic to webhook when in production
    # update(stripe_customer_id: customer.id)
  end
end
