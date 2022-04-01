class ExchangeRate < ApplicationRecord

  enum currency: { eur: 0, usd: 1 }

  scope :today, -> { where(effective_date: Date.today) }

  validates :currency, uniqueness: { scope: :effective_date, message: 'Currency already exists for this date.' }
end
