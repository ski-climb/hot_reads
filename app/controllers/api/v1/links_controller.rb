class Api::V1::LinksController < ApplicationController

  def create
    link = Link.first_or_initialize(link_params)
    if link.valid?
      link.read_count += 1
      link.save
      head 200
    else
      head 404
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
