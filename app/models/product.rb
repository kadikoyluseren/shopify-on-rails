class Product < ApplicationRecord
  has_one_attached :image

  has_many :variants, -> { where('stock > 0') }, dependent: :destroy
  accepts_nested_attributes_for :variants

  validates :name, uniqueness: :true, presence: true
  validates :price, numericality: {greater_than: 0}
  
  after_create :send_email

  # TODO
  # add validations

  before_destroy do
    Variant.destroy_all
  end

  def to_param
    name
  end

  def send_email
    UserMailer.with(user: self).welcome
  end

end