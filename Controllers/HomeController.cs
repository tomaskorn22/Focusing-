using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Focusing.Models;

namespace Focusing.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        ViewBag.Sentimientos = BD.ObtenerSentimientos();
        
        if (ViewBag.User != null)
        {   
            ViewBag.id_usuario =  ViewBag.User.id_usuario;
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
    
    public IActionResult InicioSesion(Usuario usu)
{
    string contraReal = BD.ObtenerContraseña(usu);
    if (HttpContext.Request.Method == "POST" && BD.ComprobarUsuarioValido(usu.mail, usu.contraseña))
    {
        HttpContext.Session.SetString("user", new Usuario(mail, contraseña).ToString());
        ViewBag.UserId = usu.Id_usuario;
        return RedirectToAction("Index");
    }
    else
    {
        return View("InicioSesion");
    }
}
    public IActionResult AgregarUsuario(Usuario Usu){
        BD.AgregarUsuario(Usu);
        ViewBag.UserId = Usu.Id_usuario;
        return View("Index");
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
        return View("CrearCuenta");
    }

    public IActionResult Juegos()
    {
        return View("Juegos");
    }

    public IActionResult ListaJuegos(int Id_sentimiento)
    {
        List<Juegos> juegos = BD.ObtenerJuegos(Id_sentimiento);
        ViewBag.Juegos = juegos;

        return View("Juegos");
    }

    public IActionResult ListaMelodias(int Id_sentimiento)
    {
        List<Melodias> sonidos = BD.ObtenerSonidos(Id_sentimiento);
        ViewBag.Sonidos = sonidos;

        return View("Sonidos");
    }

    public IActionResult ListaTips(int Id_sentimiento)
    {
        List<Tips> tips = BD.ObtenerTips(Id_sentimiento);
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
    string mail = HttpContext.Session.GetString("mail");
     
    if (!string.IsNullOrEmpty(mail))
    {
        Usuario usuario = new Usuario { mail = mail };
        BD.ObtenerDatos(usuario);
        ViewBag.Usuario = usuario; 
        return View("Perfil");
    }
    else
    {
        return RedirectToAction("Index"); 
    }
}

    [HttpPost]
    public IActionResult GuardarSentimientosPorUsuario(int Id_usuario, int Id_sentimiento)
    {
        Console.WriteLine(Id_usuario + "" +Id_sentimiento );
    BD.GuardarSentimientoPorUsuario(Id_usuario, Id_sentimiento);
    return RedirectToAction("Index", "Home");
    }
}
