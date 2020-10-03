class CouponsController < ApplicationController
    # What instance variable do we need to define in the CouponsController so we can access the coupons in the view? 
    def index
        @coupons = Coupon.all   
    end

    def new
        
    end

    def show
       @coupon = Coupon.find_by(id: params[:id])        
    end
    
    def create
        @coupon = Coupon.create({coupon_code: params[:coupon][:coupon_code], store: params[:coupon][:store]})
        redirect_to coupon_path(@coupon)
    end

end
 

# When you put a pry or byebug in a controller action make sure to check params 





# ActiveModel::ForbiddenAttributesError 
# Rails has a protection against manually inputting information. If you try to pass in params directly into new or create this error will be raised. 
# We have to create a whitelist of accepted parameters or retrieve the information we want individually. 

# Example
# coupon_hash =  {coupon_code: params[:coupon][:coupon_code], store: params[:coupon][:store]} 

# After using the create method and having byebug/pry we type Coupon.count to check if it increased from 0 to 1 



#No route matches {:action="show",:controller="coupons", :id=nil} missing required keys: [:id] 
# If you refer to an instance variable that hasn't been initialized, instead of getting a no method error such as undefined local variable or method you get nil 
# This is what occurs when you treat something like it exists when it doesn't exist. 
# We have not initialized it and this is why an error has occured.  

#Redirect 
# You cannot redirect to a model 
# A redirect_to will always be a "get" request. 

# After using create you either redirect to index or to show 
# If you want to show the user a form again because something was wrong we should use render 
# A redirect starts a brand new request response cycle 

# Missing Required Keys 
# This could be one of two things 
# We have used a path_helper which has a dynamic url, the part of the url that's being assigned by calling the to_param method on an object and it's expecting an argument which is a number or an object that can respond to the to_param method. Which is an ActiveRecord object we can convert to a parameter 



# Error: 
# Route to view has an index page 
# failure/error visit coupons_path

# ActionController::UnknownFormat: 
# CouponsController#index is missing a template for this request format and variant  
# This means that a view is missing  

# How do we get the coupons into the index view? 
# Update the routes.rb file 