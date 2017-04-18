class LinksController < ApplicationController

  def index
    @links = Link.by_read_count.limit(10)
  end
end
