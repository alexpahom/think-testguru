class FeedbackMailer < ApplicationMailer
  def send_to_admin(body, from)
    @email = from
    @body = body

    User.where(type: 'Admin').each { |admin| mail to: admin.email }
  end
end
