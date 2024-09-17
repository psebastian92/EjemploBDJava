<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Lista de Usuarios</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Edad</th>
                <th>Acciones</th>
            </tr>
            <%
                List<String[]> usuarios = (List<String[]>) request.getAttribute("usuarios");
                if (usuarios != null && !usuarios.isEmpty()) {
                    for (String[] usuario : usuarios) {
            %>
                <tr>
                    <td><%= usuario[0] %></td>
                    <td><%= usuario[1] %></td>
                    <td><%= usuario[2] %></td>
                    <td><%= usuario[3] %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/EditarUsuario?id=<%= usuario[0] %>" class="btn">Editar</a> |
                        <a href="${pageContext.request.contextPath}/EliminarUsuario?id=<%= usuario[0] %>" class="btn">Eliminar</a>
                    </td>
                </tr>
            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="5">No hay usuarios disponibles.</td>
                </tr>
            <%
                }
            %>
        </table>
        <a href="${pageContext.request.contextPath}/views/crear.jsp" class="btn">Crear Nuevo Usuario</a>
    </div>
</body>
</html>
