<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Usuario</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
</head>
<body>
    <h1>Crear Nuevo Usuario</h1>
   
   <form action="${pageContext.request.contextPath}/CrearUsuario" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        <br>
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required>
        <br>
        <label for="edad">Edad:</label>
        <input type="number" id="edad" name="edad" required>
        <br>
        <input type="submit" value="Crear">
    </form>
</body>
</html>
