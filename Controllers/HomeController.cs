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

    public IActionResult CrearCuenta(){
        return View();
    }
    public IActionResult InicioSesion(Usuario usu)
    {
        string contraReal = BD.ObtenerContraseña(usu);
        if(usu.Contraseña == contraReal){
            return View("InicioSesion");
        }
        else{
            return View("InicioSesion");
        }
    }
    public IActionResult AgregarUsuario(string Nombre, string Apellido, string Email, string Contraseña, int edad){
        Usuario usu = new Usuario(){
            Nombre = Nombre,
            Apellido = Apellido,
            Mail = Email,
            Contraseña = Contraseña,
            Edad = edad
        };
        

        BD.AgregarUsuario(usu);
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
    public IActionResult Calendario()
    {
        return View("Calendario");
    }
    public IActionResult Juegos()
    {
        return View("Juegos");
    }
    public IActionResult Perfil()
    {
        return View("Perfil");
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
}
