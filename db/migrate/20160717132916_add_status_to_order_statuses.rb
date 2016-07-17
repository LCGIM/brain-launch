class AddStatusToOrderStatuses < ActiveRecord::Migration
  def change
    add_column :order_statuses, :status, :string
    add_column :order_statuses, :transaction_id, :string
    add_column :order_statuses, :purchased_at, :datetime
  end
end