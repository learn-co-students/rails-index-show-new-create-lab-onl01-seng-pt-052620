# Model 

# Database 
Coupons table with coupon_code and store string type columns 

# Models 
Coupon Model 

# Views 
new.html.erb 
index.html.erb
show.html.erb 

new and create are not the same route
# Controllers 
CouponsController with actions 
index => renders associated views 
show => renders associated views
new => renders associated views 

create => handles the submission from new 


# Routes 
restful routes for coupons  

get "/coupons" => "coupons#index" #List of coupons  
get "/coupons/new" => "coupons#new" #Form to create new coupon 
get "/coupons/:id" => "coupons#show" #Details for a particular coupon 
post "/coupons" => "coupons#create" #Handles form submission of new coupon form 
get "/coupons/:id/edit" => "coupons#edit" #Renders edit coupon form 
patch "/coupons/:id" => "coupons#update"  #handles edit coupon form submission 
put "/coupons/:id" => "coupons#update"  #handles edit coupon form submission 
delete "/coupons/:id" => "coupons#destroy"  #destroys coupon 

Create is the action that handles the form submission for creating a new record 

New renders the form to create a new record 
New happens first 

# CouponsController 



# Remember 
When we have a rails server and we're making changes to our code we should keep in mind that we have two separate databases, a test database, and a development database. Your tests are interacting with your test database. Your rails console and rails server are interacting with your development database. 

Coupon.create  in the specs hasn't happen in development, we can make this happen by dropping it into the rails console 
When you are testing things in the browser make sure to remember that you are dealing with a different database than the tests are. 

Sometimes you can get your schema file out of sync when you rollback or delete certain migrations but not others. 
When you want to restart, make sure to delete test, development and schema and only then run migrate again.
If you rollback one but not the other there could be at different versions. 


 Error Code: 

Capybara::ElementNotFound 
Unable to find field "coupon[coupon_code]"
This is occuring because it's looking for a field that doesn't exist


ActionView 
If you are using ActiveView which is built into Rails you can build a `form_tag` that has a URL pointing to wherever you want to go when you submit. The default method will be post. This is different from regular forms which have a default method of get. 

The helpers that we will be using are: 

form_tag 
text_field_tag 
submit_tag 



<h1>Coupon Form</h1>
<%= form_tag coupons_path do %>   
`coupons_path` => refers to the action attribute, the method will be post unless we specify it to be otherwise    

<label>Coupon Code</label>
<%= text_field_tag :"coupon[coupon_code]" %><br>

<label> Coupon Store</label>
<%= text_field_tag :"coupon[store]" %><br>
<%= submit_tag "Submit Coupon" %>

<% end %>


`Three Important Pieces`
Method, Action, and if there is a method override (hidden input)
These 3 things will tell us where the browser will send a request when you submit the form 

Once you know the above things, you can look at your routes and find a route that matches that request and that will tell you which controller action is going to be the one you want to edit to handle the form submission. 

`What does a name of an input tell us?`
It is a key in the params hash 
The names of the inputs determines the shape of the params hash 

The names of your inputs determine the shape of the params hash 
If an input in our form doesn't have a name no matter what value is in there it will not be in params
The name in your input determines where in the params hash you will be able to access the value of the input 

The names have to correspond to setter methods on the coupon. (Whatever class you are calling the new, create, etc.)
All of the input names have to correspond to setter methods on the class for the object we are trying to build. 

The names coupon_code and store both correspond to columns in the coupons table and that gives us setter methods 
If you have input names that correspond to columns in the table for the class you are trying to create a new instance off, it's ok. If this isn't the case, you have to define additional methods. 


`The Show Action`
We use the id in the params
If we look at our routes page, and then look at the show route coupon path the :id part tells us what name we can refer to in the params hash to retrieve the value. 
 
`Linking Pages`
The place you add a link will always be where you are linking from 
When the link is clicked it take you to the place you're going to 




# Index, Show, New, Create Lab

## Objectives

1. Build a RESTful `index` action
2. Build a RESTful `show` action
3. Build a RESTful `new` action
4. Build a RESTful `create` action
5. Link pages using route helpers
6. Use route helpers in a `redirect_to`
7. Build a new form with a `form_tag`


## Instructions

This will be a pretty extensive lab that will combine a number of the concepts that we have reviewed, including:

* Drawing multiple route types

* Integrating route helper methods

* Building out a form and wiring it up to the `create` action

* Linking pages together


In this lab, the application you will be starting out with will be completely blank. There are no models, views, controllers, et cetera. It has a number of RSpec and Capybara tests that will all need to pass to complete the lab. The tests can be found in the `spec` directory, in the `models`, `features`, and `controllers` sub-directories. Feel free to walk through the specs to see what behavior the application should have when you're done.

**Note:** Like many production applications, we've included the `config/secrets.yml` file in the `.gitignore`. This means that you are going to have to create your own `config/secrets.yml` file for the application to run. Don't worry- we've given you a template. Just rename `config/secrets-template.yml` to `config/secrets.yml`, and you should be able to get the application to run.

The application you will be building is a Coupon app. Below is a high-level overview of the features you'll be building out:

* You will need to create a `coupons` table with `coupon_code` and `store` columns, which should both be of the `string` data type.

* Your `index` page should show all of the coupons in the database.

* The coupon codes on the `index` page should link to their corresponding coupon `show` page. You should use the `link_to` method and route helper methods instead of hard-coding an HTML `<a>` tag.

* Your `show` page should render the specific coupon passed to the route. E.g., `coupons/4` should show the coupon with an ID of 4.

* The `new.html.erb` view template should render a form that uses the `form_tag` method.

* The form should be wired up to the `create` action in the controller and, when submitted, should create a new record in the `coupons` table with the parameters passed through the form.

* The controller should use the `redirect_to` helper method to redirect the user to the `show` page template for the newly-created coupon.


## Resources

* [Reading on Create Action](https://github.com/learn-co-curriculum/rails-create-action-readme)

* [Reading on Form Integration](https://github.com/learn-co-curriculum/rails-form_tag-readme)
