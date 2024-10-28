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
}
