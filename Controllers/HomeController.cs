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
    public IActionResult InicioSesion()
    {
        return View();
    }
    public IActionResult CrearCuenta()
    {
        return View();
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

}
