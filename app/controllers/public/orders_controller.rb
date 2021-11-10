class Public::OrdersController < ApplicationController
    def new
        @customer = current_customer
        @cart_items = current_customer.cart_items
    end

    def create
    end

    def confirm
    end

    def complete
    end


    def index
    end

    def show
    end

end
