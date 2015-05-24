$(document).ready(function(){

	$.ajax({
		type: 'GET',
    url: 'js/box-capas2.json',
    cache: false,
		dataType: 'json',
    success: function(response){
      montaBlog(response);
    },
    error: function(jqXHR, exception) {
      if (exception === 'parsererror') {
        alert('Requested JSON parse failed.');
        
      } else if (exception === 'timeout') {
        alert('Time out error.');
      }
    }
  });

  function montaBlog(blogs) {
    $.each(blogs, function(index, blog) {
        //console.log("blog: ", blog.nome)
        var textoTruncado = blog.texto.substring(0,300); //trunca o texto

        $('.wrapper section')
        .append('<a href="'+blog.link+'" title="'+blog.nome+'" target="_blank"> <figure><img src="'+blog.imagem_destaque+'" alt="'+blog.dirblog+
          '"/> <h5>'+blog.nome+'</h5> <figcaption><h4>'+textoTruncado+'... </h4></figcaption> </figure></a>');
    });    
  }
});