let order_ids = [];
$('.confirm-cancel').css("pointer-events", order_ids.length == 0 ? "none" : 'auto');

function deleteOrders(action) {
  order_ids = [];
  var order_checkboxs = [].slice.call(document.getElementsByClassName('order-checkbox'));
  order_checkboxs.forEach(e => {
    if (e.checked) {
      order_ids.push($(e).data('order_id'));
    }
  });
  $.ajax({
    type: 'get',
    dataType: 'html',
    url: `/admin/${action}?order_ids=${order_ids}`
  });
  setTimeout(() => {
    window.location.reload();
  }, 50);
}
