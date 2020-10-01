class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #self.abstract_class = true
  protect_from_forgery with: :exception
end
