class StoresController < ApplicationController
  protect_from_forgery except: [:hook]

  def index
    @programs = Program.all
    @order_item = current_order.order_items.new
  end

  def show
    @programs = Program.all
    @order_item = current_order.order_items.new
  end


  def checkout
    @new_order = current_order
    redirect_to @new_order.paypal_url(accounts_path)
  end

  def hook
    binding.pry
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find params[:invoice]
      @order.order_status.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end
end
