class Customer::ContactsController < ApplicationController
  before_action :authenticate_customer! # ログイン済みの顧客のみアクセス可

  def new
    @contact_form = ContactForm.new
    render 'customer/contacts/new' # 明示的にビューを指定
  end

  def create
    @contact_form = ContactForm.new(contact_params)
    @customer = current_customer # 現在ログイン中の顧客を取得

    if @contact_form.valid?
      begin
        # 顧客向けのメールを送信
        ContactMailer.customer_contact_mail(@contact_form, @customer).deliver_now

        # 管理者向けのメールを送信
        ContactMailer.admin_contact_mail(@contact_form).deliver_now

        # 成功時にホーム画面に遷移し、メッセージを表示
        Rails.logger.debug(@contact.errors.full_messages)
        flash[:notice] = 'メールの送信に成功しました。'
        redirect_to root_path # ホーム画面にリダイレクト
      rescue StandardError
        Rails.logger.debug(@contact.errors.full_messages)
        Rails.logger.debug "Creating contact with params: #{contact_params.inspect}"
        flash.now[:alert] = 'メール送信に失敗しました。再度お試しください。'
        render 'customer/contacts/new', status: :unprocessable_entity
      end
    else
      Rails.logger.debug "Creating contact with params: #{contact_params.inspect}"
      flash.now[:alert] = @contact_form.errors.full_messages.to_sentence
      render 'customer/contacts/new', status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:subject, :name, :content)
  end
end
