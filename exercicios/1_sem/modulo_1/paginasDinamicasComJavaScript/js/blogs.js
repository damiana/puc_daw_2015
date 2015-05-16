$(document).ready(function(){

	$.ajax({ // ajax call starts
		type: 'POST',
		dataType: 'jsonp',
    	url: 'http://oglobo.globo.com/blogs/box-capas.asp',
       	success: function (data, status) {
       		alert('sucesso: ' + status);
        },
        error: function (xOptions, textStatus) {
        	alert('erro ao ler o json ' + textStatus);
        }
    });
	alert('aaaaaaaaaaaaa');
});