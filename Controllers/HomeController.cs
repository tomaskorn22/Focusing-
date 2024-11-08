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
        ViewBag.Sentimientos = BD.ObtenerSentimientos();
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
        if (HttpContext.Request.Method == "POST" && BD.ComprobarUsuarioValido(usu.Mail, usu.Contraseña)){
            HttpContext.Session.SetString("mail", usu.Mail);
            return RedirectToAction("Index");
        }
        else{
            return View("InicioSesion");
        }
    }

    public IActionResult AgregarUsuario(Usuario Usu){
        BD.AgregarUsuario(Usu);

        return View("Index");
    }

    public IActionResult Tips()
    {
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
        Usuario usuario = new Usuario { Mail = mail };
        BD.ObtenerDatos(usuario);
        ViewBag.Usuario = usuario; 
        return View("Perfil");
    }
    else
    {
        return RedirectToAction("Index"); 
    }
}
}
