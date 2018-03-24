class Tariff < ApplicationRecord
    monetize :price_cents
    has_many :users
    has_many :payments, through: :users

    def get_payable_price
        ActionView::Base.new.money_without_cents(self.price)
    end
end
