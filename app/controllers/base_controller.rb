class BaseController < ApplicationController
  before_action :authenticate, except: %i[index show]

  def authenticate
    redirect_to new_user_session_path unless current_user
  end
end
