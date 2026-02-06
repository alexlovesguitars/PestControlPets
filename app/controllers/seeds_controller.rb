class SeedsController < ApplicationController
  SECRET = ENV['SEEDS_SECRET']

  def run
    unless params[:secret] == SECRET
      render plain: "Unauthorized", status: :unauthorized
      return
    end

    Rails.application.load_seed
    render plain: "Seeded!"
  end
end
