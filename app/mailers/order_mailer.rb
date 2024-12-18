class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.complete.subject
  #
  def complete(args)
    email = args[:email]
    @url = 'https://shopfizz-ffbd074561a7.herokuapp.com/orders'
    mail(to: email, subject: 'ご注文が完了しました!!')
  end
end
