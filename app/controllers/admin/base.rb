class Admin::Base < ApplicationController
  before_action :admin_login_required
  
  private def admin_login_required
    raise Forbidden if not current_user&.administrator?
  end
end