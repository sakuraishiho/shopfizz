# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_invalid_customer, only: [:create]

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest_customer@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト顧客'
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲスト顧客としてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def reject_invalid_customer
    customer = Customer.find_by(email: params[:customer][:email])
    return unless customer

    return if customer.valid_password?(params[:customer][:password]) && customer.active_for_authentication?

    alert_message = if customer.status == '退会済'
                      'あなたはすでに退会しています'
                    else
                      'あなたのアカウントは停止されています'
                    end
    redirect_to request.referer, alert: alert_message
  end
end
