class Video < ActiveRecord::Base

  validates :url, presence: true

  def dropbox_url
    self.url.gsub(/dl=0/, "dl=1")
  end

end
