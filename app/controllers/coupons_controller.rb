class CouponsController < ApplicationController
    
    def index 
        # index page show all coupons
        @coupons = Coupon.all 
    end

    def show
        # show page should render the specific coupon passed to the route
        @coupon = Coupon.find(params[:id])
    end

    def create 
        @coupon = Coupon.new
        @coupon.coupon_code = params[:coupon][:coupon_code]
        @coupon.store = params[:coupon][:store]
        @coupon.save
        redirect_to coupon_path(@coupon)
    end

    def new
    end
    
end