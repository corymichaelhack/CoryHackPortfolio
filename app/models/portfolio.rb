class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||=  "https://via.placeholder.com/600x400.png
C/O https://placeholder.com/"
    self.thumb_image ||= "https://via.placeholder.com/350x200.png
C/O https://placeholder.com/"
## ||= operator is like saying
# if self.main_image == nil
#   self.main_image = "url"
# end
  end

##Scoping for custom ouputs with our topics
  # def self.angular
  #   where(subtitle: 'Angular')
  # end

  # scope :ruby_on_rails_portfolio_item, -> { where(subtitle: 'Ruby on Rails')}
end
