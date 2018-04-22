class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  layout 'layouts/admin_application'
end