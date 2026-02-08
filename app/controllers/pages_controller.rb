class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @pets = Pet.search_by_race_targets(params[:query])
    else
      @pets = Pet.all
    end
    respond_to do |format|
      format.turbo_stream { head :ok }
      format.html
    end
  end
end
