package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/basededatos";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";
    private static Connection conexion;

    private ConexionBD() {
        // Constructor privado para evitar instanciación
    }

    public static Connection obtenerConexion() throws SQLException {
        if (conexion == null || conexion.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            } catch (ClassNotFoundException e) {
                throw new SQLException("Driver JDBC no encontrado", e);
            }
        }
        return conexion;
    }

    public static void cerrarConexion() throws SQLException {
        if (conexion != null && !conexion.isClosed()) {
            conexion.close();
        }
    }
}
