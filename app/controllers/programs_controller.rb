class ProgramsController < ApplicationController

  def index
    @program = Program.all
    @order_item = current_order.order_items.new
  end


  def show
  end

end
