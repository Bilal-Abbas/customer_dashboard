class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :tax_form

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, format: { with: /\A\+\d{1,3}\d{1,14}\z/, message: "must be a valid phone number" }
  validates :company_name, presence: true, length: { maximum: 100 }
  validates :sales_tax_id, presence: true, length: { maximum: 50 }, allow_blank: true
  validates :address1, presence: true, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :zip_code, presence: true, format: { with: /\A\d{5}(-\d{4})?\z/, message: "must be a valid zip code" }
  validates :country, presence: true, length: { maximum: 50 }
  validates :business_type, presence: true

  validate :tax_form_format, if: :tax_form_present

  private

  def tax_form_present
    self.persisted? && self.tax_form.attached?
  end

  def tax_form_format
    if tax_form.attached? && !tax_form.content_type.in?(%w(application/pdf image/jpeg image/png))
      errors.add(:tax_form, "must be a PDF or image file")
    end
  end
end
