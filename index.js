var express = require("express");
var app = express();
var mysql = require("mysql");
var bodyParser = require('body-parser');


app.use(express.static("public"));

app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

var conexion = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"",
	port:"3306",
	database:"db_twitter"
});

app.get("/inicio-sesion", function(peticion, respuesta){
	conexion.query("select codigo_usuario, nombre, apellido, nickname, url_imagen_perfil, cantidad_tweets, followers, following "+
					"from tbl_usuarios;",function(error, informacion, campos){
						respuesta.send(informacion);
					});
});

app.listen(3000);

app.get("/cargar-tweets", function(peticion, respuesta){
	conexion.query("SELECT a.codigo_tweet, b.url_imagen_perfil, b.nombre, b.nickname, a.codigo_usuario, a.contenido, a.hashtags, a.fecha "+
					"FROM tbl_tweets a "+
					"INNER JOIN tbl_usuarios b "+
					"ON (a.codigo_usuario = b.codigo_usuario) "+
					"WHERE a.codigo_usuario = "+peticion.query.codigo_usuario+" "+
					"OR a.codigo_usuario in ( "+
					"select codigo_usuario_sigue from tbl_seguidores "+
					"where a.codigo_usuario = "+peticion.query.codigo_usuario+");", function(error, informacion, campos){
						respuesta.send(informacion);
					});
});

app.get("/cargar-trends", function(peticion, respuesta){
	conexion.query("select codigo_hashtag, hashtag, cantidad_tweets "+
					"from tbl_hashtags_trends;", function(error, informacion, campos){
						respuesta.send(informacion);
					});
});

app.post("/guardar-tweet", function(peticion, respuesta){
	conexion.query("INSERT INTO tbl_tweets(codigo_tweet, codigo_usuario, contenido, hashtags, fecha) VALUES (NULL, ?, ?, ?, SYSDATE());",
					[
						peticion.body.codigo_usuario,
						peticion.body.tweet,
						peticion.body.hashtag
					],
					function(error, resultado){
						if (resultado.affectedRows==1){
							conexion.query(
								"select a.codigo_tweet, b.nombre, a.contenido, a.hashtags, b.url_imagen_perfil, b.nickname "+
								"from tbl_tweets a "+
								"inner join tbl_usuarios b on a.codigo_usuario = b.codigo_usuario "+
								"WHERE codigo_tweet = ?;",
								[resultado.insertId],
								function(errorSelect, informacion, campos){
									if (errorSelect) throw errorSelect;
									respuesta.send(informacion);
								});
						}
					});
});