class StoresController < ApplicationController

  def index
    @programs = Program.all
    @order_item = current_order.order_items.new
  end

  def show
    @programs = Program.all
    @order_item = current_order.order_items.new
  end

end
