using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Focusing.Models;

namespace Focusing.Controllers;

public class HomeController : Controller
{
    const string SESSION_USUARIO = "user";
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.Usuario = ObtenerUsuario(HttpContext);
        ViewBag.Sentimientos = BD.ObtenerSentimientos();
        
        if (ViewBag.User != null)
        {   
            ViewBag.Id_usuario =  ViewBag.User.Id_usuario;
        }
        return View();
   }


    public IActionResult Calendario()
    {
        return View("Calendario");
    }

    // Método para agregar un evento
    [HttpPost]
    public IActionResult AgregarEvento(Evento evento)
    {
        BD.GuardarEvento(evento); // Llama a la base de datos para guardar el evento
        return RedirectToAction("Calendario");
    }

    // Método para obtener eventos de una fecha específica
    [HttpGet]
    public JsonResult ObtenerEventos(DateTime fecha)
    {
        var eventos = BD.ObtenerEventosPorFecha(fecha); // Llama a la base de datos para obtener eventos por fecha
        return Json(eventos);
    }
    
    public IActionResult InicioSesion(string? mail, string? contraseña)
{
    //string contraReal = BD.ObtenerContraseña(mail,contraseña);
    int idUsuario;
    Usuario? usuario = ObtenerUsuario(HttpContext);
    
    if (usuario == null && HttpContext.Request.Method == "POST" && mail != null && contraseña != null && BD.ComprobarUsuarioValido(mail,contraseña))
    {
        idUsuario = BD.ObtenerIdUsuario(mail);
        HttpContext.Session.SetInt32(SESSION_USUARIO, idUsuario);
        ViewBag.UserId = idUsuario;
        return RedirectToAction("Index");
    }
    else if (usuario == null)
    {
        return View("InicioSesion");
    }
    else
    {
        return RedirectToAction("Index");
    }
}
    public IActionResult AgregarUsuario(Usuario Usu)
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);

        if (usuario == null)
        {
            BD.AgregarUsuario(Usu);
            ViewBag.UserId = Usu.Id_usuario;
            return View("Index");
        }
        else
        {
            return RedirectToAction("Index");
        }
    }

    public IActionResult Tips(int Id_sentimiento)
    {
        ViewBag.Tips = BD.ObtenerTips(Id_sentimiento);
        return View("Tips");
    }

    public IActionResult Sonidos()
    {
        return View("Sonidos");
    }
    public IActionResult CrearCuenta()
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);

        if (usuario == null)
        {
            return View("CrearCuenta");
        }
        else
        {
            return RedirectToAction("Index");
        }
    }

    public IActionResult Juegos()
    {
        return View("Juegos");
    }

    public IActionResult ListaJuegos(int Id_sentimiento)
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);
        List<Juegos> juegos = new List<Juegos>();
        
        if (usuario != null && usuario.Id_sentimiento != null)
            juegos = BD.ObtenerJuegos(Id_sentimiento);

        ViewBag.Juegos = juegos;
        return View("Juegos");
    }

    public IActionResult ListaMelodias(int Id_sentimiento)
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);
        List<Melodias> sonidos = new List<Melodias>();

        if (usuario != null && usuario.Id_sentimiento != null)
            sonidos = BD.ObtenerSonidos(Id_sentimiento);

        ViewBag.Sonidos = sonidos;
        return View("Sonidos");
    }

    public IActionResult ListaTips()
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);
        List<Tips> tips = new List<Tips>();
        
        if (usuario != null && usuario.Id_sentimiento != null)
            tips = BD.ObtenerTips(usuario.Id_sentimiento);
        
        ViewBag.Tips = tips;
        return View("Tips");
    }

    public IActionResult RecordatorioCompleto(int id_recordatorio)
    {
        BD.RecordatorioCompleto(id_recordatorio);
        return View("Index");
    }
    public IActionResult Perfil()
    {
        Usuario? usuario = ObtenerUsuario(HttpContext);
        
        if (usuario != null)
        {
            ViewBag.Usuario = usuario; 
            return View("Perfil");
        }
        else
        {
            return RedirectToAction("Index"); 
        }
}


    public IActionResult CierreSesion()
    {
        HttpContext.Session.Remove(SESSION_USUARIO);
        return RedirectToAction("InicioSesion");
    }


    [HttpPost]
    public IActionResult GuardarSentimientosPorUsuario(int Id_usuario, int Id_sentimiento)
    {
        Console.WriteLine(Id_usuario + "" +Id_sentimiento );
    BD.GuardarSentimientoPorUsuario(Id_usuario, Id_sentimiento);
    return RedirectToAction("Index", "Home");
    }


    private static Usuario? ObtenerUsuario(HttpContext httpContext)
    {
        int? idUsuario = httpContext.Session.GetInt32(SESSION_USUARIO);
        Usuario? usuario = BD.ObtenerUsuario(idUsuario);

        return usuario;
    }
}
