class HomeController < ApplicationController

  def index
  end

  def list_article

  	#Ejemplo con relacion de dos modelos solo si se encuentran bien relacionados entre ellos

	a1=Article.find(1) #llamo a todos los articulos con id=1 y los guardo en una objeto
	a2=Article.find_by(id:"2") #llamo a todos los articulos con id=2 y los guardo en una objeto

	# Declaro un array para los comentario y articulos
	comentT = Array.new 
	articles = Array.new

	# Le agreo al array los parametro de los articulos y un ahash de loc omentarios del objeto aritculo 
	# sin necesidad de buscar los comentarios en el modelo coment

	comentT.push(:id=>a1.id,:title=> a1.title,:body=>a1.body,:coment=>a1.coment) 
	comentT.push(:id=>a2.id,:title=> a2.title,:body=>a2.body,:coment=>a2.coment)

	articles.push(:Articles=>comentT) # Agrego al arreglo articulos el hash de los comentarios

	# Convierto el array aticulo en un json para mostrar el formato en el navegador
	respond_to do |format|
		format.html 
		format.json { render json: articles }
	end

	
  end
end
