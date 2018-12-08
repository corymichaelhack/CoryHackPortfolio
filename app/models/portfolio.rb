class Portfolio < ApplicationRecord
  has_many :technologies

  accepts_nested_attributes_for :technologies,                            
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_position
    order("position ASC")  
  end

  def self.angular
    where(subtitle: 'Angular')
  end
##Scoping for custom ouputs with our topics
  # def self.angular
  #   where(subtitle: 'Angular')
  # end

  scope :ruby_on_rails_portfolio_item, -> { where(subtitle: 'Ruby on Rails')}
end
