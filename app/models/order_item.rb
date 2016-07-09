class OrderItem < ActiveRecord::Base
  belongs_to :program
  belongs_to :order
end
