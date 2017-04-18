class Api::V1::LinksController < ApplicationController

  def create
    link = Link.find_or_create_by(url: params[:link][:url])
    if link.valid?
      link.read_count += 1
      link.save
      head 200
    else
      head 404
    end
  end
end
