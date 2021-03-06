class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items
  has_many :transactions, dependent: :destroy
  validates_presence_of :status, :created_at, :updated_at

  default_scope { order(:id) }

  def self.random
    order('RANDOM()').first
  end
end
