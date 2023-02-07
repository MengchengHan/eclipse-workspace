<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Generador.Genera"
	import="java.util.HashMap, 
	java.util.Map.Entry, 
	java.util.Map,  
	java.util.ArrayList, 
	java.util.Iterator,
	DataTypes.Respuesta" 
	session="true"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="formStyles.css">
</head>
<!-- 
	Podría llevarme conmigo el HashMap a todos los jsp e ir sacando en cada uno la pregunta correspondiente
	O podría enviar a cada jsp su pregunta correspondiente, evitando así tener que lidiar con los iterators 
 -->
<%
	String pregunta = (String) request.getAttribute("pregunta1");
	ArrayList<Respuesta> respuestas = (ArrayList<Respuesta>) request.getAttribute("respuestas1"); 
	
	Map<Integer, String> mapaRespuestas = new HashMap<Integer, String>();
	
	Iterator<Respuesta> it = respuestas.iterator();
	while(it.hasNext()) {
		Respuesta r = it.next();
		mapaRespuestas.put(r.getId(), r.getEnunciado());
	}
	
	Integer [] checkedValues = (Integer []) request.getAttribute("opciones1");
%>
<body>
	<main>
		<h1>Pregunta 1</h1>
		<p><%out.print(pregunta); %></p>
		<div id="formulario">
			<form action="Core" method="post">
				<% out.print(Genera.checkboxes("opciones1", mapaRespuestas, checkedValues)); %>
				<input type="hidden" name="hidden" value="1">	
				<input type="submit" name="siguiente" value="Siguiente">
			</form>
		</div>	
	</main>
</body>
</html>