document.addEventListener("turbo:load", () => {
	const ratings = document.querySelector(".ratings");
	if (ratings) {
	  const stars = ratings.children;
  
	  // id="rating-value" と id="rating-value-display" の要素を取得
	  const ratingValue = document.getElementById("rating-value");
	  const ratingValueDisplay = document.getElementById("rating-value-display");
  
	  let index = -1;
  
	  if (stars.length > 0) {
		for (let i = 0; i < stars.length; i++) {
		  stars[i].addEventListener("mouseover", function () {
			for (let j = 0; j < stars.length; j++) {
			  stars[j].classList.remove("fa-star");
			  stars[j].classList.add("fa-star-o");
			}
			for (let j = 0; j <= i; j++) {
			  stars[j].classList.remove("fa-star-o");
			  stars[j].classList.add("fa-star");
			}
		  });
  
		  stars[i].addEventListener("click", function () {
			ratingValue.value = i + 1;
			if (ratingValueDisplay) {
			  ratingValueDisplay.textContent = ratingValue.value;
			}
			index = i;
		  });
  
		  stars[i].addEventListener("mouseout", function () {
			for (let j = 0; j < stars.length; j++) {
			  stars[j].classList.remove("fa-star");
			  stars[j].classList.add("fa-star-o");
			}
			for (let j = 0; j <= index; j++) {
			  stars[j].classList.remove("fa-star-o");
			  stars[j].classList.add("fa-star");
			}
		  });
		}
	  }
	} else {
	  console.error("ratings 要素が見つかりませんでした");
	}
  });
  
