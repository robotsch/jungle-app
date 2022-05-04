class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: Rails.application.credentials.admin[:admin_user], password: Rails.application.credentials.admin[:admin_pass]
  
  def show
  end
end
