
  # 本番環境では Heroku の環境変数を使用
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  Stripe.api_version = '2022-11-15'
