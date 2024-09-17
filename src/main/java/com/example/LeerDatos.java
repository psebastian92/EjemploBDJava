package com.example;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/leer")
public class LeerDatos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String[]> usuarios = new ArrayList<>();
        String conexionStatusInicial = "Conexión a la base de datos fallida: ";
        String conexionStatus = "Estado de conexión desconocido";

        // Verifica la conexión a la base de datos
        try (Connection conn = ConexionBD.obtenerConexion();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT NOW()")) {
            if (rs.next()) {
                conexionStatusInicial = "Conexión a la base de datos exitosa. Hora actual: " + rs.getString(1);
            }
        } catch (SQLException e) {
            conexionStatusInicial = "Conexión a la base de datos fallida: " + e.getMessage();
            e.printStackTrace();
        }

        // Obtén los datos de la tabla
        try (Connection conn = ConexionBD.obtenerConexion();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, nombre, apellido, edad FROM primeratabla")) {

            while (rs.next()) {
                String[] usuarioData = new String[4];
                int id = rs.getInt("id");
                int edad = rs.getInt("edad");
                usuarioData[0] = String.valueOf(id);
                usuarioData[1] = rs.getString("nombre");
                usuarioData[2] = rs.getString("apellido");
                usuarioData[3] = String.valueOf(edad);
                usuarios.add(usuarioData);
            }
        } catch (SQLException e) {
            conexionStatus = "Error al obtener datos de la base de datos: " + e.getMessage();
            e.printStackTrace();
        }

        // Establece los atributos y redirige al JSP
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("conexionStatusInicial", conexionStatusInicial);
        request.setAttribute("conexionStatus", conexionStatus);
        request.getRequestDispatcher("/views/leer.jsp").forward(request, response);
    }
}
