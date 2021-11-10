class Public::OrdersController < ApplicationController
    def new
        @customer = current_customer
        @cart_items = current_customer.cart_items
        @order = Order.new
    end

    def confirm
        @order = Order.new
        @order.customer = current_customer
        @order.payment_method = params[:order][:payment_method].to_i
        @cart_items = CartItem.new
        @cart_items = current_customer.cart_items
        if params[:address_selection] == 'radio1'
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.last_name + current_customer.first_name
        elsif params[:address_selection] == 'radio2'
          @order.postal_code = params[:order][:postal_code]
          @order.address = params[:order][:address]
          @order.name = params[:order][:name]
        end
    end

    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
            @cart_items = current_customer.cart_items
            @cart_items.each do |cart_item|
                @order_detail = OrderDetail.new
                @order_detail.item_id = cart_item.item.id
                @order_detail.order_id = @order.id
                @order_detail.price = cart_item.item.price
                @order_detail.amount = cart_item.amount
                @order_detail.save
            end
            current_customer.cart_items.destroy_all
            redirect_to orders_complete_path
        else
            @customer = current_customer
            @order = Order.new
            render :new
        end
    end

    def complete
    end


    def index
        @orders = current_customer.orders
    end

    def show
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment, :status)
    end
end
