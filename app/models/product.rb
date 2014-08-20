class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :title, length: {minimum: 10}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'Must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_items
  has_many :orders, through: :line_items

  def self.latest
    Product.order(:updated_at).last
  end
end
