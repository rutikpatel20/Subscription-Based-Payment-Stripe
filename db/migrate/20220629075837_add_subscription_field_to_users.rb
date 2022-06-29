class AddSubscriptionFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plan, :string
    add_column :users, :subscription_status, :string, default: "Incomplete"
  end
end
