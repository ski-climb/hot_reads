class Api::V1::Links::TopLinksController < ApplicationController

  def show
    render json: Link.top_link_url
  end
end
