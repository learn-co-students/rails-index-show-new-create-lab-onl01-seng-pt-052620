class Coupon < ApplicationRecord
#attr_accessor :coupon_code, :store
  def to_s
    self.coupon_code + " | " + self.store
  end

end
