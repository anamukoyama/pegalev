$(document).ready(function(){
  $('.cep-mask').inputmask('99999-999');

  $('#btn_no_cep').click(function(e){
    e.preventDefault();
    $('#form_search_by_cep').hide();
    $('#form_search_by_address').show();
  });
});
