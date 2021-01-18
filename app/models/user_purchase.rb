class UserPurchase
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_cord, :prefecture_id, :city, :block, :building, :tell, :token

  with_options presence: true do
    validates :postal_cord, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :tell, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :item_id #アソシエーションを記述すれば参照レコードの存在をrailsが確認しますがフォームオブジェクトではアソシエーションを組まない為
    validates :user_id #アソシエーションを記述すれば参照レコードの存在をrailsが確認しますがフォームオブジェクトではアソシエーションを組まない為
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, block: block, building: building, tell: tell, purchase_id: purchase.id)
  end
end
