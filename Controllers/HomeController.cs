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

    public IActionResult PreguntaRespondida(char Opcion, bool DobleChance = false)
    {
        bool Correcta = JuegoQQSM.RespuestaUsuario(Opcion);
        int PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        if (PosicionPozo == 15 && Correcta) { ViewBag.PozoAcumuladoSeguro = JuegoQQSM.DevolverPozoAcumuladoSeguro(); ViewBag.Player = JuegoQQSM.DevolverJugador();
        ViewBag.PosicionPozo = PosicionPozo - 1; return View("PantallaFinDelJuego"); }
        else if (Correcta) { ViewBag.Player = JuegoQQSM.DevolverJugador(); ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo();
        return View("RespuestaPreguntaOK"); }
        else if (!Correcta && DobleChance) { ViewBag.Pregunta = JuegoQQSM.DevolverPregunta(); ViewBag.ListaRespuestas = JuegoQQSM.ObtenerRespuestas(); 
        ViewBag.Player = JuegoQQSM.DevolverJugador(); ViewBag.PosicionPozo = JuegoQQSM.DevolverPosicionPozo(); ViewBag.Incorrecta = Opcion; return View("Pregunta"); }
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
        JuegoQQSM.DobleChance();
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
