class Website < ActiveRecord::Base
  before_create :randomize_id

  validates_presence_of :link, :owner, :desc

  def image
    "<img src='http://api.page2images.com/directlink?p2i_url=#{self.link}&p2i_key=#{ENV['SCREENSHOT_API_KEY']}' alt='Image for #{self.owner}'>".html_safe
  end

  def image_src
    "http://api.page2images.com/restfullink?p2i_url=#{self.link}&p2i_key=#{ENV['SCREENSHOT_API_KEY']}"
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Website.where(id: self.id).exists?
  end
end
