function is_int(value) {
  if ((parseFloat(value) == parseInt(value)) && !isNaN(value)) {
    return true;
  } else {
    return false;
  }
}

$(".fancy-form div > div").hide();

$("#zip_user").keyup(function() {

  // Cache
  var el = $(this);
  //console.log(el.val());
  var flat_string = el.val().replace (/-/g, "");
  console.log(flat_string);
  if ((flat_string.length == 8) && (is_int(flat_string))) {
    $.ajax({
      url: "https://viacep.com.br/ws/"+flat_string+"/json",
      cache: false,
      dataType: "json",
      type: "GET",
      success: function(result, success) {
        //$(".zip-error, .instructions").slideUp(200);
        $("#street_user").val(result.logradouro);
        $("#complement_user").val(result.complemento);
        $("#city_user").val(result.localidade);
        $("#state_user").val(result.uf);
        $(".fancy-form div > div").slideDown();
        $( ".submit-wrap" ).show();
        $("#zip_user").blur();
        //$("#street").show().focus();
      },
      //error: function(result, success) {
      //  $(".zip-error").slideDown(300);
      //}
    });

  } //else if (el.val().length < 5) {
    //$(".zip-error").slideUp(200);
  //};
});
