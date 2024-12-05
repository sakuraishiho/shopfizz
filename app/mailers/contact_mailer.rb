class ContactMailer < ApplicationMailer
  def customer_contact_mail(contact_form, customer)
    @contact_form = contact_form
    @customer = customer
    # 顧客向けのメールを送信
    mail(
      to: @customer.email,              # 顧客への送信先
      subject: @contact_form.subject,   # 件名
      from: @customer.email             # 送信元
    )
  end

  def admin_contact_mail(contact_form)
    @contact_form = contact_form
    Rails.logger.debug "Admin Contact Form: #{@contact_form.inspect}" # ログ出力
    # 管理者向けのメールを送信
    mail(
      to: 'sakura-35412@yahoo.ne.jp', # 管理者のメールアドレス
      subject: '新しいお問い合わせが届きました' # 件名
    )
  end
end
