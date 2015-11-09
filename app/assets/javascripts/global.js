// Close flash

$(document).ready(function() {
  $('.close[data-dismiss="alert"]').click(function(){
    $(this).parent().hide("slow");
  });
});
