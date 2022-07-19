$('#rating-form').raty({
  path: '/assets/',
  scoreName: 'review[rate]'
});
function commentHandler() {
  let comment = $("input#comment-content").val();
  // console.log($("#rating-form img")[0].attr('src'));
  var starArr = [];
  $.each($("#rating-form img"), function(key, value) {
      // console.log($(value).attr('src') == '/assets/star-off.png');
      if ($(value).attr('src') == '/assets/star-off.png') {
        starArr.push(parseInt($(value).attr('alt')));
      }
  });
  if (starArr.length == 0) {
    console.log(comment, 5, "star");
    return;
  }
  console.log(comment, Math.min(...starArr) - 1, "star");
  // var img = $("#rating-form img").forEach( img => {
  //   if ($(img).attr('src') == '/assets/star-off.png') return img;
  // })
  // $("#rating-form img").forEach(element => {
  //   console.log(element);
  // });
  // console.log($($(img.prevObject)[0]).attr('alt') - 1 );

}
</script>
