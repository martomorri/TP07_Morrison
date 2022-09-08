using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace TP7_Morrison.Models;
public static class JuegoQQSM
{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-034; DataBase=JuegoQQSM; Trusted_Connection=True;";
    private static int _PreguntaActual, _PosicionPozo, _PozoAcumuladoSeguro, _DificultadPreguntaActual; private static char _RespuestaCorrectaActual; private static List<Pozo> _ListaPozo = new List<Pozo>(); private static Jugador _Player; private static List<int> _PreguntasRespondidas = new List<int>(); private static List<Respuesta> _ListaRespuestas = new List<Respuesta>(); private static List<Pregunta> _ListaPreguntas = new List<Pregunta>();
    public static void IniciarJuego(string Nombre, DateTime FechaHora)
    {
        _PreguntaActual = 1; _DificultadPreguntaActual = 1; _RespuestaCorrectaActual = ' '; _PosicionPozo = 0; _PozoAcumuladoSeguro = 0;
        _ListaPozo.Add(new Pozo(2000, false));
        _ListaPozo.Add(new Pozo(5000, false));
        _ListaPozo.Add(new Pozo(10000, false));
        _ListaPozo.Add(new Pozo(20000, false));
        _ListaPozo.Add(new Pozo(30000, true));
        _ListaPozo.Add(new Pozo(50000, false));
        _ListaPozo.Add(new Pozo(70000, false));
        _ListaPozo.Add(new Pozo(100000, false));
        _ListaPozo.Add(new Pozo(130000, false));
        _ListaPozo.Add(new Pozo(180000, true));
        _ListaPozo.Add(new Pozo(300000, false));
        _ListaPozo.Add(new Pozo(500000, false));
        _ListaPozo.Add(new Pozo(750000, false));
        _ListaPozo.Add(new Pozo(1000000, false));
        _ListaPozo.Add(new Pozo(2000000, true));
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "CrearJugador";
            db.Execute(sp, new { @Nombre = Nombre, @FechaHora = FechaHora }, commandType: CommandType.StoredProcedure);
        }
        _Player = DevolverJugador();
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        List<Pregunta> ListaPreguntasDif = new List<Pregunta>();
        if (_PosicionPozo > 4 && _PosicionPozo <= 9) _DificultadPreguntaActual = 2;
        else if (_PosicionPozo > 9) _DificultadPreguntaActual = 3;
        else _DificultadPreguntaActual = 1;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarPreguntasXDificultad", sql = "SELECT * FROM Preguntas";
            ListaPreguntasDif = db.Query<Pregunta>(sp, new { @Dificultad = _DificultadPreguntaActual }, commandType: CommandType.StoredProcedure).ToList();
            _ListaPreguntas = db.Query<Pregunta>(sql).ToList();
        }
        Random rand = new Random();
        int num = rand.Next(1, 11);
        _PreguntaActual = ListaPreguntasDif[num - 1].IdPregunta;
        int i = 0;
        while (i < _PreguntasRespondidas.Count)
        {
            while (_PreguntaActual == _PreguntasRespondidas[i])
            {
                i = 0;
                num = rand.Next(1, 11);
                _PreguntaActual = ListaPreguntasDif[num - 1].IdPregunta;
            }
            i++;
        }
        return ListaPreguntasDif[num - 1];
    }
    public static List<Respuesta> ObtenerRespuestas()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarRespuestasXPregunta";
            _ListaRespuestas = db.Query<Respuesta>(sp, new { @IdPregunta = _PreguntaActual }, commandType: CommandType.StoredProcedure).ToList();
        }
        int i = 0, pos = -1;
        while (i < _ListaRespuestas.Count && pos == -1)
        {
            if (_ListaRespuestas[i].Correcta == true) pos = i;
            else i++;
        }
        _RespuestaCorrectaActual = _ListaRespuestas[pos].OpcionRespuesta;
        return _ListaRespuestas;
    }
    public static bool RespuestaUsuario(char Opcion)
    {
        _PreguntasRespondidas.Add(_PreguntaActual);
        if (Opcion == _RespuestaCorrectaActual)
        {
            if (_ListaPozo[_PosicionPozo].ValorSeguro == true) _PozoAcumuladoSeguro = _ListaPozo[_PosicionPozo].Importe;
            if (_PosicionPozo < 15) _PosicionPozo++;
            return true;
        }
        else return false;
    }
    public static List<Pozo> ListarPozo()
    {
        return _ListaPozo;
    }
    public static int DevolverPosicionPozo()
    {
        return _PosicionPozo;
    }
    public static char[] Descartar50()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ActualizarComodin50";
            db.Execute(sp);
        }
        int i = 0, pos = -1;
        while (i < _ListaRespuestas.Count && pos == -1)
        {
            if (_ListaRespuestas[i].Correcta == true) pos = i;
            else i++;
        }
        _ListaRespuestas.RemoveAt(pos);
        char[] VecIncorrectas = new char[2];
        Random rand = new Random();
        int num1 = rand.Next(0, 3);
        int num2 = rand.Next(0, 3);
        while (num1 == num2) num2 = rand.Next(0, 3);
        VecIncorrectas[0] = _ListaRespuestas[num1].OpcionRespuesta;
        VecIncorrectas[1] = _ListaRespuestas[num2].OpcionRespuesta;
        return VecIncorrectas;
    }
    public static void SaltearPregunta()
    {
        _PreguntasRespondidas.Add(_PreguntaActual);
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ActualizarComodinSaltear";
            db.Execute(sp);
        }
    }
    public static void DobleChance()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ActualizarComodinDobleChance";
            db.Execute(sp);
        }
    }
    public static Jugador DevolverJugador()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarUltimoJugador";
            _Player = db.QueryFirstOrDefault<Jugador>(sp, commandType: CommandType.StoredProcedure);
        }
        return _Player;
    }
    public static int DevolverPozoAcumuladoSeguro()
    {
        return _PozoAcumuladoSeguro;
    }
    public static Pregunta DevolverPregunta()
    {
        int i = 0, pos = -1;
        while (i < _ListaPreguntas.Count && pos == -1)
        {
            if (_ListaPreguntas[i].IdPregunta == _PreguntaActual) pos = i;
            else i++;
        }
        return _ListaPreguntas[pos];
    }
}