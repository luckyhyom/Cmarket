"use strict";

const imgList = document.querySelector(".imgList");
const imgs = document.querySelectorAll(".boardImg");
const arrows = document.querySelectorAll(".boardImgs > i");

// image slide
let pageX = 0;
arrows.forEach((arrow) => {
  arrow.addEventListener("click", (e) => {
    const target = e.target;
    const direction = target.classList[2];

    if (direction === "left" && pageX !== 0) {
      pageX -= 100;
      imgList.style.transform = `translateX(-${pageX}%)`;
    }

    if (direction === "right" && pageX < (imgs.length - 1) * 100) {
      pageX += 100;
      imgList.style.transform = `translateX(-${pageX}%)`;
    }
  });
});

// // slide
// let page = 0;
// leftArrow.addEventListener("click", () => {
//   if (page === 0) {
//     return;
//   }
//   page -= 100;
//   boardImg.forEach((img) => {
//     img.style.transform = `translateX(-${page}%)`;
//   });
// });

// rightArrow.addEventListener("click", () => {
//   if (page === (boardImg.length - 1) * 100) {
//     return;
//   }
//   page += 100;
//   boardImg.forEach((img) => {
//     img.style.transform = `translateX(-${page}%)`;
//   });
// });
