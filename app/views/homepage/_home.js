var swiper = new Swiper(".home-slider", {
  loop:true,
  grabCursor:true,
  effect: "flip",
  pagination: {
  el: ".swiper-pagination",
  clickable:true,
},
});

$(".custom_add_to_cart").on('click', function(){
  const my_cart = $(".icons .my_cart")[0].innerHTML
  $(".icons .my_cart")[0].innerHTML = parseInt(my_cart) + 1
  console.log(my_cart)
})
