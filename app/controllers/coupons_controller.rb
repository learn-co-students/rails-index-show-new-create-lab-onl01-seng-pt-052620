class CouponsController < ApplicationController
    
    def index
        @coupons = Coupon.all
    end
    

    def show 
    
    end
    

    def new
    

    end
    

    def create
        @coupon = Coupon.create({ coupon_code: params[:coupon][:copon_code], store:params[:coupon][:store]})
        redirect_to coupon_path(@coupon)
    end
end
