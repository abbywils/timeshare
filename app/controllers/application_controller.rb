class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_logged_in
end
