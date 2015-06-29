class Link < ActiveRecord::Base
  validates :link, presence: :true
  after_create :generate_slug

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def display_slug
    ENV['STOCK_URL'] + self.slug
  end
end
