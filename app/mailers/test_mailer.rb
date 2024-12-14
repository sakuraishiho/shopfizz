class TestMailer < ApplicationMailer
    def test_email
      mail(
        to: 'dpro202407@gmail.com',  # 送信先のメールアドレス
        subject: 'Test Email',    # メールの件名
        body: 'This is a test email.'  # メール本文
      )
    end
end