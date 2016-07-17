class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :order_status
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal
  before_update :update_total

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  serialize :notification_params, Hash

  def paypal_url(return_path)
    values = {
        business: "seller@bl.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: '1.11',
        item_name: 'some product',
        item_number: '1',
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    total =
        self.update()
  end
end
