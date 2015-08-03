
$(document).ready(function() {
  $("#choose-it").click(function(){
   $("#choose-report").toggle();
    $("#create-input").hide();
  });
});


$(document).ready(function() {
  $("#create-it").click(function(){
   $("#create-input").toggle();
    $("#choose-report").hide();
  });
});



$(document).ready(function() {
  $("#print-it").click(function(){
   print();
  });
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

