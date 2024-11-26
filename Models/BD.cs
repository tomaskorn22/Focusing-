using System.Data.SqlClient;
using Dapper;

public static class BD
{
    const string _connectionString = "Server=localhost;DataBase=Focusing Empowering Minds;Trusted_Connection=True;";

    public static void AgregarUsuario(Usuario Usu){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Usuarios (Nombre, Apellido, Mail, Contraseña, Edad) VALUES (@pNombre, @pApellido, @pMail, @pContraseña, @pEdad)";
            db.Execute(sql, new{pNombre = Usu.Nombre, pApellido = Usu.Apellido,  pMail = Usu.Mail, pContraseña = Usu.Contraseña, pEdad = Usu.Edad});
        }
    }

    public static void AgregarObjetivo(Objetivo Obj){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Objetivos (Sentimiento, Tiempo, Materia) VALUES (@pSentimiento, @pTiempo, @pMateria)";
            db.Execute(sql, new{pSentimiento = Obj.Sentimiento, pTiempo = Obj.Tiempo,  pMateria = Obj.Materia});
        }
    }

    public static void ObtenerDatos(Usuario Usu)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Usuarios WHERE Nombre = @pNombre";
        Usuario usuario = db.QueryFirstOrDefault<Usuario>(sql, new { pNombre = Usu.Nombre });

        if (usuario != null)
        {
            Usu.Apellido = usuario.Apellido;
            Usu.Mail = usuario.Mail;
            Usu.Edad = usuario.Edad;
        }
    }
}

    public static List<Juegos> ObtenerJuegos(int Id_sentimiento){
        List<Juegos> Juego = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Juegos WHERE id_juegos = @Id_sentimiento";
            Juego = db.Query<Juegos>(sql, new {@Id_sentimiento = Id_sentimiento}).ToList();
        }
        return Juego;
    }

    public static List<Sentimientos> ObtenerSentimientos(){
        List<Sentimientos> Sentimientos = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Sentimientos";
            Sentimientos = db.Query<Sentimientos>(sql).ToList();
        }
        return Sentimientos;
    }
   public static List<Melodias> ObtenerSonidos(int Id_sentimiento)
    {
        List<Melodias> sonidos = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Melodias WHERE id_Melodias = @Id_sentimiento";
            sonidos = db.Query<Melodias>(sql, new {@Id_sentimiento = Id_sentimiento}).ToList();
        }
        return sonidos;
    } 

   public static List<Tips> ObtenerTips(int Id_sentimiento)
    {
        List<Tips> tips = null;

        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Tips WHERE id_tips = @Id_sentimiento";
            tips = db.Query<Tips>(sql, new {@Id_sentimiento = Id_sentimiento}).ToList();
        }
        return tips;
   }
    public static void GuardarRecordatorio(Recordatorio Rec){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Recordatorio (Titulo, Descripcion, Fecha, Categoria) VALUES (@pTitulo, @pDescripcion, @pFecha, @pCategoria)";
            db.Execute(sql, new{pTitulo = Rec.Titulo, pDescripcion = Rec.Descripcion,  pFecha = Rec.Fecha, pCategoria = Rec.Categoria});
        }
    }
    public static void RecordatorioCompleto(int IdRec){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "DELETE FROM Recordatorios WHERE id_recordatorio = @pIdRec";
            db.Execute(sql, new{pIdRec = IdRec});
        }
    }

    public static string ObtenerContraseña(Usuario Usu)
    {   
        string contraReal;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Contraseña FROM Usuarios WHERE Nombre = @pUsu";
            contraReal = db.QueryFirstOrDefault<string>(sql, new { pUsu = Usu.Nombre });
        }
        return contraReal;
   } 
   public static void GuardarEvento(Evento evento)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Evento (Titulo, Descripcion, Fecha) VALUES (@pTitulo, @pDescripcion, @pFecha)";
            db.Execute(sql, new { pTitulo = evento.Titulo, pDescripcion = evento.Descripcion, pFecha = evento.Fecha });
        }
    }

    public static List<Evento> ObtenerEventosPorFecha(DateTime fecha)
    {
        List<Evento> eventos = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Eventos WHERE Fecha = @pFecha";
            eventos = db.Query<Evento>(sql, new { pFecha = fecha }).ToList();
        }
        return eventos;
    }
    public static bool ComprobarUsuarioValido(string mail, string contraseña)
    {
        string mensajeSalida;

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "EXEC SP_ComprobarUsuarioValido @pmail, @pcontraseña";
            mensajeSalida = db.QueryFirst<string>(sql, new { pmail = mail, pcontraseña = contraseña });
        }

        return mensajeSalida == "exitoso";
    }
    public static void GuardarSentimientoPorUsuario(int Id_usuario, int Id_sentimiento)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "INSERT INTO Usuarios (Id_sentimiento) VALUES ( @pId_sentimiento)";
        db.Execute(sql, new { pId_sentimiento = Id_sentimiento });
    }
}

}