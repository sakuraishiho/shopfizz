// class="ratings" の要素を取得
const ratings = document.querySelector(".ratings");
if (ratings) {
  const stars = ratings.children; // 子要素を取得

  // id="rating-value" と id="rating-value-display" の要素を取得
  const ratingValue = document.getElementById("rating-value");
  const ratingValueDisplay = document.getElementById("rating-value-display");

  // index を初期化
  let index = -1; // 初期値を -1 にして未選択を表現

  // stars が存在する場合のみ処理を進める
  if (stars.length > 0) {
    for (let i = 0; i < stars.length; i++) {
      // 星にカーソルが乗ったときの処理
      stars[i].addEventListener("mouseover", function () {
        for (let j = 0; j < stars.length; j++) {
          // すべての星を初期状態に戻す
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
        }
        for (let j = 0; j <= i; j++) {
          // カーソルが乗った星まで塗りつぶす
          stars[j].classList.remove("fa-star-o");
          stars[j].classList.add("fa-star");
        }
      });

      // 星がクリックされたときの処理
      stars[i].addEventListener("click", function () {
        ratingValue.value = i + 1;
        if (ratingValueDisplay) {
          ratingValueDisplay.textContent = ratingValue.value;
        }
        index = i; // クリックされた星の番号を保存
      });

      // 星からカーソルが離れたときの処理
      stars[i].addEventListener("mouseout", function () {
        for (let j = 0; j < stars.length; j++) {
          // すべての星を初期状態に戻す
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
        }
        for (let j = 0; j <= index; j++) {
          // クリックされている星まで塗りつぶす
          stars[j].classList.remove("fa-star-o");
          stars[j].classList.add("fa-star");
        }
      });
    }
  }
} else {
  console.error("ratings 要素が見つかりませんでした");
}
