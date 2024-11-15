public class Usuario
{
    public int id_usuario {get;set;}
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Mail { get; set; }
    public string Contraseña { get; set; }
    public int  Edad { get; set; }


public static Usuario FromString(string userData)
    {
        if (string.IsNullOrEmpty(userData)) return null;

        return System.Text.Json.JsonSerializer.Deserialize<Usuario>(userData);
    }

    
public string ToJson()
    {
        return System.Text.Json.JsonSerializer.Serialize(this);
    }



}