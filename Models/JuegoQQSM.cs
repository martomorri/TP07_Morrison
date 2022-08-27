using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Dapper;
public static class JuegoQQSM
{
    private static string _connectionString = @"Server=LAPTOP-B9I9AIHD\SQLEXPRESS; DataBase=JuegoQQSM; Trusted_Connection=True;";
    private static int _PreguntaActual, _PosicionPozo, _PozoAcumuladoSeguro, _PozoAcumulado, _DificultadPreguntaActual; private static char _RespuestaCorrectaActual; private static bool _Comodin5050, _ComodinDobleChance, _ComodinSaltearPregunta; private static List<Pozo> _ListaPozo = new List<Pozo>(); private static Jugador _Player; private static List<int> _PreguntasRespondidas = new List<int>();
    public static void IniciarJuego(string Nombre, DateTime FechaHora)
    {
        _PreguntaActual = 1; _DificultadPreguntaActual = 1; _RespuestaCorrectaActual = ' '; _PosicionPozo = 1; _PozoAcumuladoSeguro = 0; _PozoAcumulado = 0; _Comodin5050 = true; _ComodinDobleChance = true; _ComodinSaltearPregunta = true;
        _ListaPozo.Add(new Pozo(2000,false));
        _ListaPozo.Add(new Pozo(5000,false));
        _ListaPozo.Add(new Pozo(10000,false));
        _ListaPozo.Add(new Pozo(20000,false));
        _ListaPozo.Add(new Pozo(30000,true));
        _ListaPozo.Add(new Pozo(50000,false));
        _ListaPozo.Add(new Pozo(70000,false));
        _ListaPozo.Add(new Pozo(100000,false));
        _ListaPozo.Add(new Pozo(130000,false));
        _ListaPozo.Add(new Pozo(180000,true));
        _ListaPozo.Add(new Pozo(300000,false));
        _ListaPozo.Add(new Pozo(500000,false));
        _ListaPozo.Add(new Pozo(750000,false));
        _ListaPozo.Add(new Pozo(1000000,false));
        _ListaPozo.Add(new Pozo(2000000,true));
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "CrearJugador";
            db.Execute(sp, new { @Nombre = Nombre, @FechaHora = FechaHora }, commandType: CommandType.StoredProcedure);
        }
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        Random rand = new Random();
        int num = rand.Next(1, 6);
        _PreguntaActual = num;
        List<Pregunta> ListaPreguntas = new List<Pregunta>();
        int i = 0;
        while (i < _PreguntasRespondidas.Count)
        {
            while (_PreguntaActual == _PreguntasRespondidas[i])
            {
                i = 0;
                num = rand.Next(1, 6);
                _PreguntaActual = num;
            }
            i++;
        }
        if (_PosicionPozo > 5 && _PosicionPozo <= 10) _DificultadPreguntaActual = 2;
        else if (_PosicionPozo > 10) _DificultadPreguntaActual = 3;
        else _DificultadPreguntaActual = 1;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarPreguntasXDificultad";
            ListaPreguntas = db.Query<Pregunta>(sp, new { @Dificultad = _DificultadPreguntaActual }, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPreguntas[_PreguntaActual - 1];
    }
    public static List<Respuesta> ObtenerRespuestas(int IdPregunta)
    {
        List<Respuesta> ListaRespuestas = new List<Respuesta>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarRespuestasXPregunta";
            ListaRespuestas = db.Query<Respuesta>(sp, new { @IdPregunta = IdPregunta }, commandType: CommandType.StoredProcedure).ToList();
        }
        int i = 0, pos = -1;
        while (i < ListaRespuestas.Count && pos == -1)
        {
            if (ListaRespuestas[i].Correcta == true) pos = i;
            else i++;
        }
        _RespuestaCorrectaActual = ListaRespuestas[pos].OpcionRespuesta;
        return ListaRespuestas;
    }
    public static bool RespuestaUsuario(char Opcion, char OpcionComodin)
    {
        _PreguntasRespondidas.Add(_PreguntaActual);
        if (OpcionComodin != ' ')
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarComodinDobleChance";
                db.Execute(sp, new { @IdJugador = _Player.IdJugador });
            }
        }
        if (Opcion == _RespuestaCorrectaActual || OpcionComodin == _RespuestaCorrectaActual)
        {
            if (_ListaPozo[_PosicionPozo].ValorSeguro == true) _PozoAcumulado += _ListaPozo[_PosicionPozo].Importe;
            _PosicionPozo++;
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
        if (_Player.Comodin50 == true)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarComodin50";
                db.Execute(sp, new { @IdJugador = _Player.IdJugador });
            }
            List<Respuesta> ListaRespuestas = ObtenerRespuestas(_PreguntaActual);
            int i = 0, pos = -1;
            while (i < ListaRespuestas.Count && pos == -1)
            {
                if (ListaRespuestas[i].Correcta == true) pos = i;
                else i++;
            }
            ListaRespuestas.Remove(ListaRespuestas[pos]);
            char[] VecIncorrectas = new char[2];
            Random rand = new Random();
            int num1 = rand.Next(1, 4);
            int num2 = rand.Next(1, 4);
            while (num1 == num2) num2 = rand.Next(1, 4);
            VecIncorrectas[0] = ListaRespuestas[num1].OpcionRespuesta;
            VecIncorrectas[1] = ListaRespuestas[num2].OpcionRespuesta;
            return VecIncorrectas;
        }
        else return null;
    }
    public static void SaltearPregunta()
    {
        if (_Player.ComodinSaltear == true)
        {
            _PreguntasRespondidas.Add(_PreguntaActual);
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarComodinSaltear";
                db.Execute(sp, new { @IdJugador = _Player.IdJugador });
            }
        }
    }
    public static Jugador DevolverJugador(DateTime FechaHora)
    {
        Jugador Player = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarJugador";
            Player = db.QueryFirstOrDefault<Jugador>(sp, new { @FechaHora = FechaHora }, commandType: CommandType.StoredProcedure);
        }
        return Player;
    }
}