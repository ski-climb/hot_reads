class Api::V1::Links::HotLinksController < ApplicationController

  def index
    render json: Link.by_read_count.limit(10).drop(1).pluck(:url)
  end
end
