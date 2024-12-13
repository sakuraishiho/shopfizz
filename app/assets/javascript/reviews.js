document.addEventListener("turbo:load", function() {
  // class = "ratings"を取得
  const ratingsElement = document.querySelector(".ratings");

  // ratingsElementが存在する場合のみ処理を実行
  if (ratingsElement) {
    initializeRating(ratingsElement);
  }

  function initializeRating(ratingsElement) {
    const stars = ratingsElement.children;
    const ratingValue = document.getElementById("rating-value");
    const ratingValueDisplay = document.getElementById("rating-value-display");
    let num;

    for (let i = 0; i < stars.length; i++) {
      stars[i].addEventListener("mouseover", function() {
        for (let j = 0; j < stars.length; j++) {
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
        }
        for (let j = 0; j <= i; j++) {
          stars[j].classList.remove("fa-star-o");
          stars[j].classList.add("fa-star");
        }
      });

      stars[i].addEventListener("click", function() {
        ratingValue.value = i + 1;
        ratingValueDisplay.textContent = ratingValue.value;
        num = i;
      });

      stars[i].addEventListener("mouseout", function() {
        for (let j = 0; j < stars.length; j++) {
          stars[j].classList.remove("fa-star");
          stars[j].classList.add("fa-star-o");
        }
        if (num >= 0) {
          for (let j = 0; j <= num; j++) {
            stars[j].classList.remove("fa-star-o");
            stars[j].classList.add("fa-star");
          }
        }
      });
    }
  }
});
