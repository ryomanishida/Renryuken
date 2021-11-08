class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.new
    @cart_items = current_customer.cart_items
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    unless @cart_item.amount.nil?#数量選択の是非
        @cart_items = current_customer.cart_items
        @cart_items.each do |cart_item|
          if cart_item.item_id == @cart_item.item_id#同じ商品を合体
            new_amount = cart_item.amount + @cart_item.amount
            cart_item.update_attribute(:amount, new_amount)
            @cart_item.delete
          end
        end
        @cart_item.save
        redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      render ('public/items/show')
    end
  end


  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = CartItem.new
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
