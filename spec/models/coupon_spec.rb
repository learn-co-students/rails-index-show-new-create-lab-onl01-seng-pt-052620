require 'rails_helper'

describe Coupon do
  before(:each) do
    @coupon = Coupon.create!(coupon_code: "FREESTUFF", store: "Chipotle")
  end


# create! raises an exception while create returns the object (unsaved object if it does not pass validations).
# save! raises an error while save returns true/false.
# save does not take attributes, create does.

  # When you pass in a hash to create what is it first going to do with the hash? 
# Checks if the Coupon class is present. 
# What will active record do with the keys in the hash? 

# When you call create, the keys in the Hash do not have to be columns in the associated column but they do have to correspond to 

# The keys don't always have to correspond with columns in a table. 

  it 'can be created' do
    expect(@coupon).to be_valid
  end
end
# EXPLANATION 
# When you call create / new / build on a model and you pass in a Hash we iterate over the attributes and for each key in the hash we send the each we're building a new instance of the setter method for that key or attribute and we pass in the value as an argument.   If an attribute isn't present an error will occur. 
# If we have columns for the keys ActiveRecord will provide us with setter and getter methods for all of them. 
# The point is that they do not have to be columns but they do have to correspond to setter methods. 
# Sometimes we want to take data from a form that does not correspond to a column, this occurs when the format you receive from the user is not a suitable format to store in the database or the table directly.  If you have a setter method for that input you can do this.  It's important to have setter methods for user inputs.     

# class  InterActiveRecord
#   def initialize(attributes={})
#     attributes.each do |key, value| 
#       self.send("#{key}=", value)
#     end 
#   end  
# end 
