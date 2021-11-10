class Order < ApplicationRecord
    belongs_to :customer
    
    enum payment_method: { クレジットカード: 0, 店頭支払い: 1 }
end
