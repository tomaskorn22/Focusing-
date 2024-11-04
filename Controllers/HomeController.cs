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
    public IActionResult AgregarUsuario(Usuario Usu){
        BD.AgregarUsuario(Usu);
        return View("Index");
    }
    public IActionResult Tips()
    {
        return View();
    }
    public IActionResult Sonidos()
    {
        return View();
    }
    public IActionResult Calendario()
    {
        return View();
    }
    public IActionResult Juegos()
    {
        return View();
    }
    public IActionResult Perfil()
    {
        return View();
    }

    public IActionResult ListaJuegos()
    {
        List<Juegos> juegos = BD.ObtenerJuegos();
        ViewBag.Juegos = juegos;

        return View("Juegos");
    }
   public IActionResult ListaMelodias()
   {
    List<Melodias> sonidos = BD.ObtenerSonidos();
    ViewBag.Sonidos = sonidos;

    return View("Sonidos");
   }
   public IActionResult ListaTips()
   {
        List<Tips> tips = BD.ObtenerTips();
        ViewBag.Tips = tips;
        return View("Tips");
   }

   public IActionResult RecordatorioCompleto(int id_recordatorio)
    {
        BD.RecordatorioCompleto(id_recordatorio);
        return View("Index");
    }
}
