class Profile < ApplicationRecord
  validates :name, presence: true

  has_rich_text :bio
  has_many :socials, dependent: :destroy
  accepts_nested_attributes_for :socials, reject_if: :all_blank

  has_one_attached :avatar
  validate :image_avatar_type
  belongs_to :user

  private

  def image_avatar_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
      errors.add(:avatar, 'must be a JPEG or PNG.')
    # elsif avatar.attached? == false
    #   errors.add(:avatar, 'required.')
    end
  end
end
