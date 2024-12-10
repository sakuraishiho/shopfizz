# Docker のインストール（for Mac）

以下サイトを参考にしてください。  
↓  
[Docker インストール（for Mac）](https://zenn.dev/farstep/books/7f169cdc597ada/viewer/4f6d6f)

# Docker のインストール（for Windows）

以下サイトを参考にしてください。  
↓  
[Docker インストール（for Windows）](https://zenn.dev/giana12th/articles/6cc6540e0dd306)

---

# 開発環境

### 01 開発言語
- **Ruby**: 3.1.2
- **Rails**: 7.0.4

### 02 UI
- **Tailwind CSS**

### 03 決済機能
- **Stripe**

### 04 環境構築
- **Docker**

### 05 データベース
- **Redis**
- **PostgreSQL**: 15.1 (Debian 15.1-1.pgdg110+1)

### 06 コードの品質管理
- **Sidekiq**
- **RuboCop**

### 07 テキストエディタ
- **Visual Studio Code**

### 08 テキストフォント
- **hachi-maru-pop-regular**

### 09 グラフ描画ツール
- **graphviz version 2.43.0 (0)**

---


# 実行手順

以下の手順に従って環境をセットアップしてください。  
↓

```bash
# リポジトリをクローン
$ git clone https://git@github.com:sakuraishiho/shopfizz.git
$ cd shopfizz

# 必要に応じて特定のブランチに切り替え
$ git checkout -b step1  # 任意のブランチ名

# .env.exampleファイルをコピー
$ cp .env.example .env

# Dockerビルドの実行
$ docker-compose build

# 2つ目のターミナルで実行
$ ./run rails db:setup

# コンテナを開始
$ docker compose up

# コンテナを停止
$ docker compose down
```

---


# Gem File

```bash
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "sidekiq", "~> 7.0"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "bootsnap", require: false
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "rails-erd"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "devise"
gem "stripe"
gem 'devise-i18n'
gem 'kaminari', '1.2.2'
gem 'kaminari-actionview', '1.2.2'
gem 'kaminari-activerecord', '1.2.2'
gem 'kaminari-core', '1.2.2'
```

---


# 実行手順

以下の手順に従って環境をセットアップしてください。  
↓

```bash
# gemのインストール
$ docker-compose run --rm web bash
$ bundle install

# Dockerビルドの実行
$ docker-compose build

# Dockerマイグレーションの実行
$ docker-compose run --rm　web rake db:migrate
```

---


# カタログ設計
<https://docs.google.com/spreadsheets/d/11q4k7NTEOfUuA8FurhN79Z86FBvZ4V3FcT8Be0Ynwcc/edit?gid=1407875893#gid=1407875893>

---


# テーブル定義書
<https://docs.google.com/spreadsheets/d/11q4k7NTEOfUuA8FurhN79Z86FBvZ4V3FcT8Be0Ynwcc/edit?gid=205804934#gid=205804934>

---


# ワイヤーフレーム
##### 管理者  
<https://drive.google.com/drive/folders/1i3bN2RQ0yiN6qNnOIfIbArZjXtsNrxzc?usp=sharing>

##### 利用者    
<https://drive.google.com/drive/folders/1EC46rW1iPL674b-tuT8Pl878OkUTNaXn?usp=sharing>

##### ログアウト中  
<https://drive.google.com/drive/folders/1WzGMTd2No0rSUdT0LIKB13XxbunwTO0H?usp=sharing>

---


# ER図
`![ER図](https://raw.githubusercontent.com/sakuraishiho/Shopfizz/refs/heads/main/app/assets/svg/er.svg)

---


# 画面遷移図
##### 管理者  
`![表示](https://raw.githubusercontent.com/sakuraishiho/Shopfizz/refs/heads/main/app/assets/svg/admin.svg)

##### 利用者  
`![表示](https://raw.githubusercontent.com/sakuraishiho/Shopfizz/refs/heads/main/app/assets/svg/customer.svg)