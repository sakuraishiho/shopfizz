p '==================== admin create ===================='
admins = [
  { email: "admin1@example.com", password: "password123" },
  { email: "admin2@example.com", password: "password123" },
  { email: "admin3@example.com", password: "password123" },
  { email: "admin4@example.com", password: "password123" },
  { email: "admin5@example.com", password: "password123" }
]

admins.each do |admin|
  Admin.create!(admin)
end

p '==================== customer create ===================='
Customer.create!(name: "櫻井 志保", email: "dpro202407@gmail.com", password: "111111")
Customer.create!(name: "佐藤 真守", email: "dpro202408@gmail.com", password: "111111")
Customer.create!(name: "田中 早紀", email: "dpro202409@gmail.com", password: "111111")
Customer.create!(name: "星野 由衣", email: "dpro202410@gmail.com", password: "111111")
Customer.create!(name: "鈴木 花子", email: "dpro202411@gmail.com", password: "111111")

p '==================== product create ===================='
product1 = Product.new(
    name: "もなか",
    description: "【商品説明】
    ＜無添加・糸モナカ＞有機農家の厳選素材で手詰めを楽しむ手作り最中（4種の手作り餡・半月モナカの皮16枚）です。\n
    【原材料】
    さつまいも（福岡県糸島産）、小豆、もち米、奄美諸島産素焚糖（オリーブ餡、ビーツ餡、カカオに使用）、上白糖（あんこに使用）、カカオマス、オリーブリーフパウダー（福岡県糸島産）、ビーツパウダー（九州産）、天日塩",
    price: 1577,
    stock: 30
)
product1.image.attach(io: File.open(Rails.root.join('app/assets/images/assorted_monaka.jpg')), filename: 'assorted_monaka.jpg')
product1.save!

product2 = Product.new(
    name: "クッキー",
    description: "【商品説明】
    100%植物性ヴィーガンクッキー＜マハロクッキー缶＞卵・乳製品・白砂糖不使用なのでアレルギーがある方でも召し上がれます。\n
    【原材料】
    [オートミールフルーツ&ナッツクッキー]
    有機オートミール(アメリカ)北海道産小麦粉、圧搾絞り菜種油、有機カレンツ、有機クルミ、甜菜糖、国産無調整豆乳、米飴、有機かぼちゃ種、有機ひまわり種、自家製甘夏ピール、海水塩 
    [メープルココナッツボール] 
    北海道産小麦粉、国産全粒粉、有機コーンスターチ、有機ココナッツファイン、有機メープルシロップ、圧搾絞り菜種油、国産無調整豆乳、アルミフリーベーキングパウダー、海水塩 
    [メープルショートブレッド] 
    北海道産小麦粉、圧搾絞り菜種油、信州産米粉、有機メープルシロップ、海水塩 
    [キャロブスパイスクッキー] 
    北海道産小麦粉、有機メープルシロップ、圧搾絞り菜種油、有機キャロブ粉、アーモンド粉、素精糖、有機スパイス、海水塩 
    [自家製酵母ラズベリージャムクッキー] 
    北海道産小麦粉、甜菜糖、圧搾絞り菜種油、自家製酵母、マハロ庭のラズベリー、海水塩 
    [自家製酵母シナモンパイ] 
    北海道産小麦粉、国産無調整豆乳、圧搾絞り菜種油、素精糖、自家製酵母、甜菜糖、国産全粒粉、海水塩 
    (原材料の一部に小麦、大豆、クルミを含む)",
    price: 3000,
    stock: 30
)
product2.image.attach(io: File.open(Rails.root.join('app/assets/images/assorted_cookies.jpg')), filename: 'assorted_cookies.jpg')
product2.save!

product3 = Product.new(
    name: "フィナンシェ",
    description: "【商品説明】
    【贈りものに】 グルテンフリー無添加フィナンシェギフト 卵・乳製品・小麦不使用です。 \n
    【原材料】
    〈プレーン〉
    アーモンドパウダー（無添加）、有機豆乳（国産有機大豆１００％）、有機ココナッツオイル、米（熊本県産・農薬不使用栽培）、有機きび糖、米飴、塩（海の精） 
    〈オーガニックショコラ〉
    有機豆乳（国産有機大豆１００％）、アーモンドパウダー（無添加）、有機ココナッツオイル、有機きび糖、米（熊本県産・農薬不使用栽培）、米飴、有機カカオパウダー、塩（海の精）",
    price: 4080,
    stock: 30
)
product3.image.attach(io: File.open(Rails.root.join('app/assets/images/financier.jpg')), filename: 'financier.jpg')
product3.save!

product4 = Product.new(
    name: "ドーナツ",
    description: "【商品説明】
    ＜ギフトにオススメ＞有機素材の無添加焼きドーナツ＜米粉の麹ドーナツ＞小麦・卵・乳製品・白砂糖不使用しています。 \n
    【原材料】 
    無農薬甘糀、有機豆乳、無農薬米粉、無農薬生おから、有機アーモンドプードル 、太白胡麻油(圧搾製法)、有機きび糖、有機ココナッツフラワー、ベーキングパウダー (アルミフリー)、天日海塩 

    以上が基本材料となります。 
    フレーバーはこちらに追加材料が加わります。 

    [プレーン]
    有機バニラエクストラクト、チョコチップアーモンド:有機チョコレート、有機カカオパウダー、有機アーモンド 
    [ラムレーズン]
    有機レーズン、有機ラム酒、有機バニラエクストラクト 
    [シナモンくるみ＆レーズン]
    有機シナモンパウダー、有機レーズン、スパイスミックス、有機くるみ 
    [抹茶あずき]
    有機抹茶パウダー、有機小豆 
    [レモンケーキ]
    有機レモンオイル、ピスタチオ、有機ココナッツオイル 
    [ココナッツチョコ]
    有機カカオパウダー、有機ココナッツ 
    [ダブルチョコ]
    有機チョコレート、有機ラズベリー、有機カカオパウダー 
    [アールグレイ&キャラメルナッツ]
    有機アールグレイ、有機カシューナッツ、有機くるみ 
    [黒胡椒くるみ]
    有機黒胡椒、有機くるみ 
    [ブルーベリークランブル]
    無農薬ブルーベリー、無農薬バタフライピー 
    [チョコミント]
    チョコレート、有機ミントオイル 
    [チョコバナナ]
    有機バナナ、チョコレート 
    [イチジクの紅茶煮]
    有機ドライイチジク、有機抹茶パウダー、ラム酒、有機アールグレイ 
    [コーヒー小豆]
    有機コーヒー、有機小豆 
    [ダブルコーヒ]
    有機コーヒー、有機玄米パフ、有機ココナッツオイル、粉糖 
    [ストロベリークランブル]
    有機苺ジャム、有機ビーツパウダー 
    [アールグレイ&オレンジピール]
    有機アールグレイ、有機オレンジピール、有機レーズン、ラム酒 
    [抹茶オレンジピール]
    有機抹茶パウダー、有機チョコ、有機オレンジピール、ラム酒 
    [ブラックココア&白あん]
    ブラックココア、白あん、ココアパウダー 
    [はちみつクランブル]
    有機はちみつ(非加熱) 
    [ピーナッツバター]
    有機ピーナッツバター、有機ひまわりの種、有機カボチャの種 
    [ほうじ茶&栗]
    有機甘栗、ほうじ茶パウダー、有機小豆 
    [パンプキン]
    無農薬南瓜、無農薬南瓜パウダー、ココナッツミルク、カカオパウダー、ココアパウダー、有機キヌア、有機南瓜の種 
    [ダブルさつまいも]
    無農薬さつまいも、ココナッツミルク、紫芋パウダー、黒胡麻 
    [金木犀＆りんごクランブル]
    無農薬りんご、金木犀 
    [カレー]
    有機にんじん、有機玉ねぎ、有機カレーミックス、有機黒胡椒 
    [抹茶＆ピーナッツ餡]
    有機抹茶パウダー、有機ピーナッツバター、白あん、有機ひまわりの種",
    price: 2780,
    stock: 30
)
product4.image.attach(io: File.open(Rails.root.join('app/assets/images/assorted_donuts.jpg')), filename: 'assorted_donuts.jpg')
product4.save!

product5 = Product.new(
    name: "チーズケーキ",
    description: "【商品説明】
    自然栽培いせひかり糀甘酒のチーズケーキ・無添加手作り・グルテンフリー•ノンアルコールなのでお子様でも食べて頂けます。 \n
    【原材料】 
    クリームチーズ（北海道製造）、生クリーム（北海道製造）、卵、いせひかり糀甘酒（兵庫県製造）、きび砂糖（さとうきび（国内産））、蜂蜜、米粉（米（兵庫県）） 
    （一部に乳成分•卵を含む）",
    price: 3200,
    stock: 30
)
product5.image.attach(io: File.open(Rails.root.join('app/assets/images/cheese_cake.jpg')), filename: 'cheese_cake.jpg')
product5.save!

product6 = Product.new(
    name: "ロールケーキ",
    description: "【商品説明】
    ＜無添加・つぶつぶ糸島いちごロール＞有機農家の厳選素材でふわっ、もちっの新食感です。 \n
    【原材料】
    卵（佐賀県産）、生クリーム（九州産）、小麦粉（福岡県産）、牛乳（福岡県糸島産）、いちご（福岡県糸島産）
    素焚糖（奄美諸島産）、菜種油（国産）、アルミフリーベーキングパウダー",
    price: 2050,
    stock: 30
)
product6.image.attach(io: File.open(Rails.root.join('app/assets/images/strawberry-roll-cake.jpg')), filename: 'strawberry-roll-cake.jpg')
product6.save!

product7 = Product.new(
    name: "バームクーヘン",
    description: "【商品説明】
    山形県庄内産はえぬき米粉を100%使用した生地に、庄内産のラ・フランスを加え焼き上げたバームクーヘンです。 \n
    【原材料】 
    卵（山形県産）、砂糖、バター、米粉（山形県産はえぬき）、米粉でんぷん、生クリーム、水飴、マジパンローマッセ（アーモンド、砂糖） 
    ラ・フランス（山形県庄内産）／香料、着色料（ベニバナ、クチナシ、紅麹色素）（原材料の一部に卵・乳成分を含む）",
    price: 1480,
    stock: 30
)
product7.image.attach(io: File.open(Rails.root.join('app/assets/images/baumkuchen.jpg')), filename: 'baumkuchen.jpg')
product7.save!

product8 = Product.new(
    name: "ロールケーキ",
    description: "【商品説明】
    山形県庄内産はえぬき米粉、庄内産の卵を使用し、しっとりふわふわに焼き上げた生地に、和栗ペーストと渋皮付きの和栗ダイスをちりばめた純生クリームを贅沢に巻き上げました。 \n
    【原材料】 
    生クリーム(北海道産)、栗（国産）、砂糖、卵、米粉(山形県庄内産はえぬき)、バター、牛乳、はちみつ/ (一部に卵、乳を含む)",
    price: 2180,
    stock: 30
)
product8.image.attach(io: File.open(Rails.root.join('app/assets/images/roll_cake_maron.jpg')), filename: 'roll_cake_maron.jpg')
product8.save!

product9 = Product.new(
    name: "テリーヌ",
    description: "【商品説明】
    フローズンラズベリームース★小麦・乳・卵・白砂糖不使用★グルテンフリー、植物由来、プラントベース、ビーガン、オーガニックなので原材料にはこだわっています。 \n
    【原材料】 
    豆乳加工食品（植物油脂、豆乳クリーム（大豆を含む）、砂糖類、その他）（国内製造）、木苺ピューレ（木苺、転化糖シロップ） 
    有機アガベシロップ、アーモンドミルク、有機粉末アーモンド、木苺ブロークン、食用米油、大豆粉、米粉、有機ココアパウダー、有機砂糖 
    濃縮還元レモン果汁、寒天、米酢、食用バラ花びら／膨張剤、ゲル化剤（増粘多糖類）、乳化剤（大豆由来）、ｐH調整剤、セルロース、酸化防止剤（V.E)",
    price: 4320,
    stock: 30
)
product9.image.attach(io: File.open(Rails.root.join('app/assets/images/strawberry_terrine.jpg')), filename: 'strawberry_terrine.jpg')
product9.save!

product10 = Product.new(
    name: "チーズタルト",
    description: "【商品説明】
    バター不使用のザクほろ米粉タルトに、なめらかでさっぱりかつ濃厚なチーズケーキを合わせました。チーズケーキは生クリームの代わりにヨーグルトを使用しヘルシーにしています。 \n
    【原材料】 
    【タルト生地】卵、粉糖、米油、製菓用米粉、アーモンドプードル、片栗粉 
    【チーズケーキ生地】クリームチーズ、プレーンヨーグルト、卵、グラニュー糖、レモン汁、製菓用米粉",
    price: 3580,
    stock: 30
)
product10.image.attach(io: File.open(Rails.root.join('app/assets/images/cheese_tart.jpg')), filename: 'cheese_tart.jpg')
product10.save!

product11 = Product.new(
    name: "クッキー",
    description: "【商品説明】
    クランベリーが入ったチェリーのクッキー生地にストロベリーシュガーをトッピング。甘酸っぱくて春をイメージしたクッキーです。 \n
    【原材料】 
    小麦粉（国内製造）、米油、黒糖、てんさい糖、ライ小麦、豆乳、さくらんぼシロップ（さつまいも糖、水（鉱泉水）他）、食塩／膨張剤、クエン酸、香料、（一部に小麦・大豆を含む）",
    price: 2480,
    stock: 30
)
product11.image.attach(io: File.open(Rails.root.join('app/assets/images/berry_cookies.jpg')), filename: 'berry_cookies.jpg')
product11.save!

product12 = Product.new(
    name: "テリーヌ",
    description: "【商品説明】
    白砂糖・卵・乳製品・小麦粉を使わず、48度以下で焼かずに作り上げた、心と身体に優しいスイーツ。オーガニックや無農薬など素材にも拘り、食べた人が笑顔になる、そんなスイーツをお届けしています。 \n
    【原材料】 
    チョコレート（国内製造、乳不使用）、豆乳、加工油脂、砂糖、調製豆乳、大豆加工品（植物油脂、豆乳クリーム、その他）、抹茶
    寒天／ゲル化剤（加工でん粉、増粘多糖類）、乳化剤、安定剤（加工でん粉）、香料、（一部に大豆を含む）",
    price: 4800,
    stock: 30
)
product12.image.attach(io: File.open(Rails.root.join('app/assets/images/green_tea_tenine.jpg')), filename: 'green_tea_tenine.jpg')
product12.save!

product13 = Product.new(
    name: "バームクーヘン",
    description: "【商品説明】
    山形県庄内地方のはえぬき米粉100%の生地に庄内名産アンデスメロンを加えて焼き上げました。 \n
    【原材料】 
    卵(山形県産)、有機砂糖、バター、米粉（山形県はえぬき）、米でんぷん、生クリーム、水あめ
    マジパンローマッセ（アーモンド、砂糖）、メロン果肉（山形県庄内産）、着色料（クチナシ、ベニバナ）、香料 / （一部に卵、乳成分含む）",
    price: 1720,
    stock: 30
)
product13.image.attach(io: File.open(Rails.root.join('app/assets/images/baumkuchen_meron.jpg')), filename: 'baumkuchen_meron.jpg')
product13.save!

product14 = Product.new(
    name: "ロールケーキ",
    description: "【商品説明】
    山形県庄内産はえぬき米粉、庄内産の卵を使用し、しっとりふわふわに焼き上げた生地に、庄内産ラ・フランスと生クリームを贅沢に巻き上げました。 \n
    【原材料】 
    クリーム（国内製造）、卵、ラ・フランス、有機砂糖、米粉、バター、牛乳、はちみつ、白ワイン(原材料の一部に卵、乳成分を含む)",
    price: 1980,
    stock: 30
)
product14.image.attach(io: File.open(Rails.root.join('app/assets/images/roll_cake.jpg')), filename: 'roll_cake.jpg')
product14.save!

p '==================== Order create ===================='
Customer.pluck(:id).each do |customer_id|
    # 顧客ごとに5件の注文を作成
    5.times do |i|
      Order.create!(
        customer_id: customer_id,
        name: "Order ##{i + 1} for Customer #{customer_id}",
        billing_amount: 0,
        postal_code: "123-4567",
        prefecture: "Tokyo",
        address1: "Shinjuku 1-1-1",
        address2: "Building 101",
        postage: 500,
        status: 0
      )
    end
end

p '==================== CartItem create ===================='
5.times do
  CartItem.create!(
    quantity: rand(1..5),
    customer_id: Customer.pluck(:id).sample,
    product_id: Product.pluck(:id).sample
  )
end

p '==================== OrderDetail create ===================='
Customer.pluck(:id).each do |customer_id|
    # 顧客ごとに作成した注文ごとにOrderDetailを作成
    5.times do |i|
      order = Order.find_by(customer_id: customer_id, name: "Order ##{i + 1} for Customer #{customer_id}")
  
      total_amount = 0  # 小計を初期化
  
      # 各注文に5件のOrderDetailを作成
      5.times do
        product = Product.order('RANDOM()').first # ランダムに商品を選択
        price = rand(1000..5000)                  # 商品の価格をランダムに設定
        quantity = rand(1..3)                     # 注文数量をランダムに設定
  
        # OrderDetail を作成
        order_detail = OrderDetail.create!(
          price: price,
          quantity: quantity,
          order_id: order.id,
          product_id: product.id
        )
  
        # 小計に価格 * 数量を加算
        total_amount += price * quantity
      end
  
      # billing_amount を更新 (小計 + 送料)
      order.update!(billing_amount: total_amount + order.postage)
    end
end

p '==================== Review create ===================='
Product.find_each do |product|
  5.times do
    Review.create!(
      content: "これはレビュー内容です。",
      score: rand(1..5),
      customer_id: Customer.pluck(:id).sample,  # 顧客をランダムに選択
      product_id: product.id  # 商品ごとにレビューを作成
    )
  end
end