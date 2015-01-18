class Website < ActiveRecord::Base
  before_create :randomize_id

  validates_presence_of :link, :owner, :desc

  def image
    "<img src='http://ascreen.herokuapp.com/?url=#{self.link}&quality=1' alt='Image for #{self.owner}' class='screenshot'>".html_safe
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Website.where(id: self.id).exists?
  end
end
