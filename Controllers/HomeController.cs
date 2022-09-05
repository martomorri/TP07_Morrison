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
    
    [HttpPost]
    public IActionResult Jugar(string Nombre)
    {
        DateTime FechaHora = DateTime.Now;
        JuegoQQSM.IniciarJuego(Nombre, FechaHora);
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("Pregunta");
    }

    public IActionResult Pregunta()
    {
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("Pregunta");
    }

    public IActionResult PreguntaRespondida(char Opcion, char OpcionComodin = ' ')
    {
        bool Correcta = JuegoQQSM.RespuestaUsuario(Opcion, OpcionComodin);
        int PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        if (PosicionPozo == 14 && Correcta) { ViewBag.PozoAcumuladoSeguro = JuegoQQSM.DevolverPozoAcumuladoSeguro(); ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo(); return View("PantallaFinDelJuego"); }
        else if(Correcta) { ViewBag.Player = JuegoQQSM.DevolverJugador(); ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("RespuestaPreguntaOK"); }
        else
        {
            ViewBag.PozoAcumuladoSeguro = JuegoQQSM.DevolverPozoAcumuladoSeguro();
            ViewBag.Player = JuegoQQSM.DevolverJugador();
            ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
            return View("PantallaFinDelJuego");
        }
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.PozoAcumuladoSeguro = JuegoQQSM.DevolverPozoAcumuladoSeguro();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("PantallaFinDelJuego");
    }

    public IActionResult Descartar50()
    {
        ViewBag.VecIncorrectas = JuegoQQSM.Descartar50();
        ViewBag.Pregunta = JuegoQQSM.DevolverPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("Pregunta5050");
    }

    public IActionResult DobleChance()
    {
        ViewBag.Pregunta = JuegoQQSM.DevolverPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("PreguntaDobleChance");
    }

    public IActionResult SaltearPregunta()
    {
        JuegoQQSM.SaltearPregunta();
        ViewBag.Pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("Pregunta");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
