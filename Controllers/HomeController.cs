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
        DateTime FechaHora = DateTime.Now;
        JuegoQQSM.IniciarJuego(Nombre, FechaHora);
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozos = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }

    public IActionResult PreguntaRespondida(char Opcion1, char Opcion2)
    {
        bool Correcta = JuegoQQSM.RespuestaUsuario(Opcion1,Opcion2);
        if(Correcta) return View("RespuestaPreguntaOK");
        else return View("PantallaFinDelJuego");
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        return View("PantallaFinDelJuego");
    }

    public IActionResult Comodin50()
    {
        ViewBag.VecIncorrectas = JuegoQQSM.Descartar50();
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozos = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }

    public IActionResult ComodinSalear()
    {
        JuegoQQSM.SaltearPregunta();
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.ListaPozos = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
