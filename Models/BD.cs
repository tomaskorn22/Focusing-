using System.Data.SqlClient;
using Dapper;

public static class BD
{
    const string _connectionString = "Server=localhost;DataBase=Focusing Empowering Minds;Trusted_Connection=True;";

    public static void AgregarUsuario(Usuario Usu){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Usuarios (Nombre, Apellido, Mail, Contraseña, Edad) VALUES (@pNombre, @pApellido, @pMail, @pConraseña, @pEdad)";
            db.Execute(sql, new{pNombre = Usu.Nombre, pApellido = Usu.Apellido,  pMail = Usu.Mail, pContraseña = Usu.Contraseña, pEdad = Usu.Edad});
        }
    }

    public static void AgregarObjetivo(Objetivo Obj){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Objetivos (Sentimiento, Tiempo, Materia) VALUES (@pSentimiento, @pTiempo, @pMateria)";
            db.Execute(sql, new{pSentimiento = Obj.Sentimiento, pTiempo = Obj.Tiempo,  pMateria = Obj.Materia});
        }
    }

    public static void ObtenerDatos(Usuario Usu){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Usuarios WHERE Nombre = @pNombre";
            db.QueryFirstOrDefault(sql, new{Usuario = Nombre});
        }
    }

    public static void GuardarRecordatorio(Recordatorio Rec){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Recordatorio (Sentimiento, Tiempo, Materia) VALUES (@pSentimiento, @pTiempo, @pMateria)";
            db.Execute(sql, new{pSentimiento = Obj.Sentimiento, pTiempo = Obj.Tiempo,  pMateria = Obj.Materia});
        }
    }
}