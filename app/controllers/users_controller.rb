class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => ["create"]
  after_filter :cors_set_access_control_headers
  respond_to :json

  def create
    if check_session
      render :json, "User already registered"
    else
      user = User.new(email: params['email'], name: params['name'])
      if user.save
        render json: "OK"
        create_session
      else
        render json: email_errors(user)
      end
    end
  end


  private

  def email_errors(user_record)
    user_record.errors.messages[:email]
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
