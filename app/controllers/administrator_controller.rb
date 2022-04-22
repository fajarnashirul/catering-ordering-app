class AdministratorController < ApplicationController
  include SessionHelper
  before_action :check_login
  def index
  end

end
