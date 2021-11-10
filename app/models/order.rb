class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    enum payment_method: { クレジットカード: 0, 店頭支払い: 1 }
    enum status: { 入金待ち: 0, 発送準備中: 1, 発送済み: 2 }
end
