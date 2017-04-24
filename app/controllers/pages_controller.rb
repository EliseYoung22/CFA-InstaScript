class PagesController < ApplicationController
  before_action :authenticate_user! , only: [:dashboard]
  def home
    if current_user
      redirect_to medications_path
    end
  end

  def dashboard
    @medications = current_user.medications

  end
end
