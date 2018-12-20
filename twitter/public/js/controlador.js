$(document).ready(function(){
	console.log("El DOM ha sido cargado");
	contenidoTrends='<h2>Trends</h2>';
	$.ajax({
		url:"/cargar-trends",
		dataType:"json",
		success:function(respuesta){
			for (var i = 0; i < respuesta.length; i++) {
				contenidoTrends+='<div><span class="blue-text">'+respuesta[i].hashtag+'</span> <small>'+respuesta[i].cantidad_tweets+' tweets</small></div>';
				
			}
			$("#div-trends").append(contenidoTrends);
		}
	});

});
 
$("#btn-login").click(function(){
	//Ejecutar esto en caso de que el login sea exitoso. Escribir el codigo del usuario logueado en un input oculto.
	/*var parametros = "Usuario="+$("#txt-usuario").val();
	console.log(parametros);*/
	$.ajax({
		url:"/inicio-sesion",
		dataType:"json",
		success:function(respuesta){
			for (var i=0; i<respuesta.length; i++){
				if(($("#txt-usuario").val()) == respuesta[i].nickname){
					$("#div-login").fadeOut(200,function(){
						$("#div-detalles-usuario").fadeIn(200);
					});
					$("#div-detalles-usuario").html('<div class="component-header">'+
							'<img src = "'+respuesta[i].url_imagen_perfil+'" class="img-fluid rounded-circle img-thumbnail">'+
							'</div>'+
							'<hr>'+
							'<h2 class="blue-text">'+respuesta[i].nombre+' '+respuesta[i].apellido+'</h2>'+
							'<small>'+respuesta[i].nickname+'</small>'+
							'<hr>'+
							'<div class="row">'+
							'<div class="col-lg-4">'+
							'Tweets<br>'+
							'<span class="blue-text">5</span>'+
							'</div>'+
							' <div class="col-lg-4">'+
							'Following<br>'+
							' <span class="blue-text">4</span>'+
							'</div>'+
							'<div class="col-lg-4">'+
							' Followers<br>'+
							'<span class="blue-text">3</span>'+
							' </div>'+
							'</div>');
					$("#txt-codigo_usuario").val(respuesta[i].codigo_usuario);
					$("#picturesProfile").attr("src",respuesta[i].url_imagen_perfil);
					$("#tweets").fadeIn(100);
					$("#navbar-user-section").fadeIn(100);
					cargarTweets();
				}
			}
		}
	});	
});

$("#btn-logout").click(function(){
	$("#div-detalles-usuario").fadeOut(200,function(){
		$("#div-login").fadeIn(200);
	});
	$("#txt-usuario").val("");
	$("#txt-contrasenia").val("");
	$("#txt-codigo_usuario").val("");
	$("#tweets").fadeOut(100);
	$("#navbar-user-section").fadeOut(100);	
});

function cargarTweets(){
	var parametros = "codigo_usuario="+$("#txt-codigo_usuario").val();
	console.log(parametros); 
	$.ajax({
		url:"/cargar-tweets",
		data:parametros,
		dataType:"json",
		success:function(respuesta){
			console.log(respuesta);
			contenidoTweets='';
			for (var i=0; i<respuesta.length; i++){
			var mensaje = respuesta[i].contenido;
			mensaje = mensaje.replace(':)', '<img src = "img/emojis/emoji1.png">');
			mensaje = mensaje.replace('XD', '<img src = "img/emojis/emoji2.png">');
			mensaje = mensaje.replace(':P', '<img src = "img/emojis/emoji3.png">');
			mensaje = mensaje.replace(':(', '<img src = "img/emojis/emoji4.png">');
			mensaje = mensaje.replace(':*', '<img src = "img/emojis/emoji5.png">');
			mensaje = mensaje.replace('X_X', '<img src = "img/emojis/emoji6.png">');
			mensaje = mensaje.replace('|**|', '<img src = "img/emojis/emoji7.png">');
			contenidoTweets +='<div class="row component text-left">'+
							'<div class="col-lg-2">'+
							'<img src = "'+respuesta[i].url_imagen_perfil+'" class="img-fluid rounded-circle img-thumbnail">'+
							'</div>'+
							'<div class="col-lg-10">'+
							'<b>'+respuesta[i].nombre+'</b> '+respuesta[i].nickname+''+
							'<div class="tweet-content">'+
							' '+mensaje+''+
							'<div>'+
							' <small class="blue-text">'+respuesta[i].hashtags+'</small>'+
							'</div>'+
							'</div>'+
							'</div>'+
							'</div>';
			
		}
		$("#tweets").html(contenidoTweets);
		}
	});

}

$("#btn-tweet").click(function(){

	var parametros = "codigo_usuario="+$("#txt-codigo_usuario").val()+"&"+
					"tweet="+$("#txt-tweet").val()+"&"+
					"hashtag="+$("#txt-hashtag").val();
	console.log(parametros);
	$.ajax({
		url:"/guardar-tweet",
		method:"POST",
		data:parametros,
		success: function(respuesta){
			/*var mensaje = respuesta[0].contenido;*/
			var mensaje = respuesta[0].contenido;
			mensaje = mensaje.replace(':)', '<img src = "img/emojis/emoji1.png">');
			mensaje = mensaje.replace('XD', '<img src = "img/emojis/emoji2.png">');
			mensaje = mensaje.replace(':P', '<img src = "img/emojis/emoji3.png">');
			mensaje = mensaje.replace(':(', '<img src = "img/emojis/emoji4.png">');
			mensaje = mensaje.replace(':*', '<img src = "img/emojis/emoji5.png">');
			mensaje = mensaje.replace('X_X', '<img src = "img/emojis/emoji6.png">');
			mensaje = mensaje.replace('|**|', '<img src = "img/emojis/emoji7.png">');
			$("#tweets").append('<div class="row component text-left">'+
							'<div class="col-lg-2">'+
							'<img src = "'+respuesta[0].url_imagen_perfil+'" class="img-fluid rounded-circle img-thumbnail">'+
							'</div>'+
							'<div class="col-lg-10">'+
							'<b>'+respuesta[0].nombre+'</b> '+respuesta[0].nickname+''+
							'<div class="tweet-content">'+
							' '+mensaje+''+
							'<div>'+
							' <small class="blue-text">'+respuesta[0].hashtags+'</small>'+
							'</div>'+
							'</div>'+
							'</div>'+
							'</div>');
		}
	});
	$("#txt-tweet").val("");
	$("#txt-hashtag").val("");
});