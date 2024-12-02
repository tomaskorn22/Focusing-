using System;
using System.Text.Json;

[Serializable]
public class Usuario
{
    public int Id_usuario { get; set; }
    public string nombre { get; set; }
    public string apellido { get; set; }
    public string mail { get; set; }
    public string contraseña { get; set; }
    public int edad { get; set; }
    public int Id_sentimiento { get; set; }

    
    public Usuario(string mail, string contraseña)
    {
        this.mail = mail;
        this.contraseña = contraseña;
    }

    
    public Usuario() { }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (string.IsNullOrEmpty(json))
        {
            return null;
        }

        return JsonSerializer.Deserialize<Usuario>(json);
    }
}
