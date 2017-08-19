class Account < ApplicationRecord
  validates :phone, presence: true, uniqueness: true
  validates :code, presence: true

  after_create :send_sms

  def generate_code
    self.code = SecureRandom.hex(6)[0,6].upcase
  end

  def activate
    self.update active: true
  end

  private

    def send_sms
      @twilio.api.account.messages.create from: ENV['APP_PHONE_NUMBER'],
        to: phone, body: I18n.t("Your #{ENV['APP_NAME']} code is #{code}")
    end
end
