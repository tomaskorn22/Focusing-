using System.Data.SqlClient;
using Dapper;

public static class BD
{
    const string CONNECTION_STRING = "Server=localhost;DataBase=Focusing Empowering Minds;Trusted_Connection=True;";

    public static void AgregarUsuario(Usuario Usu){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Usuarios (Nombre, Apellido, Mail, Contraseña, Edad) VALUES (@pNombre, @pApellido, @pMail, @pConraseña, @pEdad)";
            db.Execute(sql, new{pNombre = Usu.Nombre, pApellido = Usu.Apellido,  pMail = Usu.Mail, pContraseña = Usu.Contraseña, pEdad = Usu.Edad});
        }
    }
}