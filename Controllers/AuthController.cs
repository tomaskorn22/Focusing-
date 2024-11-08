using Microsoft.AspNetCore.Mvc;

namespace test_session.Controllers
{
    public class AuthController : Controller
    {
        public IActionResult Login()
        {
            // Redirige al home si el usuario ya está logueado
            if (HttpContext.Session.GetString("user") != null)
                return RedirectToAction("Index", "Home");
            return View();
        }

        [HttpPost]
        public IActionResult VerificarLogin(string email, string password)
        {
            // Verifica el login con valores predefinidos
            if (email == "admin@gmail.com" && password == "admin")
            {
                HttpContext.Session.SetString("mail", email); // Solo guardar el email
                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Email o contraseña incorrectos."; // Muestra el error si los datos son incorrectos
            return View("Login");
        }

        public IActionResult Logout()
        {
            // Elimina la sesión del usuario y redirige al login
            HttpContext.Session.Remove("user");
            return RedirectToAction("Login");
        }
    }
}
