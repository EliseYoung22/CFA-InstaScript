class PagesController < ApplicationController
  def home
    if current_user
      redirect_to medications_path
    end
  end
end
