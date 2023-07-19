# frozen_string_literal: true

module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :password, presence: true, if: proc { |user| user.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(value)
    if value.nil?
      self.password_digest = nil
    elsif value.present?
      @password = value
      self.password_digest = digest(value)
    end
  end

  private

  def digest(password_string)
    Digest::SHA1.hexdigest password_string
  end
end
