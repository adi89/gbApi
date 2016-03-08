class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def check_session
    session['user_email_input'].present?
  end

  def create_session
    session['user_email_input'] = 'registered'
  end

  protect_from_forgery with: :exception
end
