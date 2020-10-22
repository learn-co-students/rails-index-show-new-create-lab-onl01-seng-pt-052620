class CouponsController < ApplicationController

    def index
        @coupon = Coupon.all
    end

    def show
        @coupon = Coupon.find(params[:id])
    end

    def new
        @coupon = Coupon.new
    end 

    def create
        @coupon = Coupon.new(coupon_params)
        if @coupon.save
        redirect_to coupon_path(@coupon)
        else
            render :new
        end
    end

    private

    def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
    end
end
