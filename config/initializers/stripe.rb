if Rails.env.production?
  # 本番環境では Heroku の環境変数を使用
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  Stripe.api_version = '2022-11-15'
else
  # 開発環境では Rails.credentials を使用
  Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
  Stripe.api_version = '2022-11-15'
end
