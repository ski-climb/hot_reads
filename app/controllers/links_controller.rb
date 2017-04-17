class LinksController < ApplicationController

  def index
    @links = Link.by_read_count
  end
end
