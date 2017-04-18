class Link < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :url, case_sensitive: false

  scope :by_read_count, -> { order(read_count: :desc) }

  def self.top_link_url
    Link.by_read_count.limit(1).pluck(:url)
  end
end
