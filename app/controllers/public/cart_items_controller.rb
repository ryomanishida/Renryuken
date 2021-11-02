class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.new
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # @cart_item.customer_id = current_customer.id
    # @cart_item = current_customer.cart_items
  #   # unless @cart_item.amount.nil?
    if @cart_item.save
      redirect_to cart_items_path
    # else
  #   #   @item = Item.find(params[:cart_item][:item])
  #   #   render ('public/item/show')
    end
  end


  # def create
  #   @cart_item=CartItem.new(cart_item_params)
  #   @cart_item.customer_id=current_customer.id
  #   @cart_items=current_customer.cart_items
  #   unless @cart_item.amount.nil? #もし@cart_item.amountが空じゃなければ
  #     @cart_items.each do |cart_item| #同一商品をカートに追加した時
  #       if cart_item.item_id == @cart_item.item_id
  #         new_amount = cart_item.amount + @cart_item.amount
  #         cart_item.update_attribute(:amount, new_amount)
  #         @cart_item.delete
  #       end
  #     end
  #     @cart_item.save #通常の時
  #     redirect_to cart_items_path
  #   else #空(個数選択)であれば
  #     @item=Item.find(params[:cart_item][:item_id])
  #     render ("public/items/show")
  #   end
  # end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
