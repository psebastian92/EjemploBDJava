<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <h1>Editar Usuario</h1>
    <form action="${pageContext.request.contextPath}/EditarUsuario" method="post">
        <input type="hidden" name="id" value="<%= ((String[])request.getAttribute("usuario"))[0] %>">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="<%= ((String[])request.getAttribute("usuario"))[1] %>" required>
        <br>
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" value="<%= ((String[])request.getAttribute("usuario"))[2] %>" required>
        <br>
        <label for="edad">Edad:</label>
        <input type="number" id="edad" name="edad" value="<%= ((String[])request.getAttribute("usuario"))[3] %>" required>
        <br>
        <input type="submit" value="Actualizar">
    </form>
</body>
</html>
