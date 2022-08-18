using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_Morrison.Models;

namespace TP7_Morrison.Controllers;

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

    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult Jugar(string Nombre)
    {
        int id = 1;
        BD.GuardarUsuario(Nombre);
        ViewBag.Pregunta = BD.ListarPregunta(id);
        ViewBag.ListaRespuestas = BD.ListarRespuestas(id);
        ViewBag.Player = Nombre;
        ViewBag.ListaPozos = ListaPozos;
        return View("Pregunta");
    }

    public IActionResult PreguntaRespondida(char Opcion1, char Opcion2)
    {
        char Correcta = BD.ListarCorrecta(id);
        if(Opcion1 == Correcta || Opcion2 == Correcta) return View("RespuestaPreguntaOK");
        else return View("PantallaFinDelJuego");
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.Player = BD.ListarJugador(id);
        return View("PantallaFinDelJuego");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
