class ContactMailer < ApplicationMailer
  def customer_contact_mail(contact_form, customer)
    @contact_form = contact_form
    @customer = customer
    # 顧客向けのメールを送信
    mail(
      to: admin@example.com,              # 顧客への送信先
      subject: @contact_form.subject,   # 件名
      from: @customer.email             # 送信元
    )
  end
end
