using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Dapper;
public static class JuegoQQSM
{
    private static string _connectionString = @"Server=LAPTOP-B9I9AIHD\SQLEXPRESS; DataBase=JuegoQQSM; Trusted_Connection=True;";
    private static int _PreguntaActual, _PosicionPozo, _PozoAcumuladoSeguro, _PozoAcumulado; private static char _RespuestaCorrectaActual; private static bool _Comodin5050, _ComodinDobleChance, _ComodinSaltearPregunta; private static List<Pozo> _ListaPozo; private static Jugador _Player; private static List<int> _PreguntasRespondidas;
    public static void IniciarJuego(string Nombre, DateTime FechaHora)
    {
        Random rand = new Random();
        int num = rand.Next(1, 15);
        _PreguntaActual = num; _RespuestaCorrectaActual = ' '; _PosicionPozo = 1; _PozoAcumuladoSeguro = 0; _PozoAcumulado = 0; _Comodin5050 = true; _ComodinDobleChance = true; _ComodinSaltearPregunta = true;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "CrearJugador";
            db.Execute(sp, new { @Nombre = Nombre, @FechaHora = FechaHora }, commandType: CommandType.StoredProcedure);
        }
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        Pregunta pregunta = null;
        int i = 0;
        while (i < _PreguntasRespondidas.Count)
        {
            while (_PreguntaActual == _PreguntasRespondidas[i])
            {
                i = 0;
                Random rand = new Random();
                int num = rand.Next(1, 15);
                _PreguntaActual = num;
            }
            i++;
        }
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarPreguntasXID";
            pregunta = db.QueryFirstOrDefault(sp, new { @IdPregunta = _PreguntaActual }, commandType: CommandType.StoredProcedure);
        }
        return pregunta;
    }
    public static List<Respuesta> ObtenerRespuestas()
    {
        List<Respuesta> ListaRepsuestas = new List<Respuesta>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarRespuestasXPregunta";
            pregunta = db.Query<Respuesta>(sp, new { @IdPregunta = _PreguntaActual }, commandType: CommandType.StoredProcedure).ToList();
        }
        int i = 0, pos = -1;
        while (i < ListaRepsuestas.Count && pos == -1)
        {
            if (ListaRepsuestas[i].Correcta == true) pos = i;
            else i++;
        }
        _RespuestaCorrectaActual = ListaRepsuestas[pos].OpcionRespuesta;
        return ListaRepsuestas;
    }
    public static bool RespuestaUsuario(char Opcion, char OpcionComodin)
    {
        _PreguntasRespondidas.Add(_PreguntaActual);
        if (OpcionComodin != null)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sp = "ActualizarComodinDobleChance";
                db.Execute(sp, new { @IdJugador = _Player.IdJugador });
            }
        }
        if (Opcion == _RespuestaCorrectaActual || OpcionComodin = _RespuestaCorrectaActual)
        {
            if (_ListaPozo[_PosicionPozo].ValorSeguro = true) _PozoAcumulado += _ListaPozo[_PosicionPozo].Importe;
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
            List<Respuesta> ListaRespuestas = ObtenerRespuestas();
            char[] VecIncorrectas = new char[2];
            Random rand = new Random();
            int num1 = rand.Next(1, 4);
            if (ListaRespuestas[num1].Correcta == false) VecIncorrectas[0] = ListaRespuestas[num1].OpcionRespuesta;
            else
            {
                while (ListaRespuestas[num1].Correcta == true)
                {
                    num1 = rand.Next(1, 4);
                }
                VecIncorrectas[0] = ListaRespuestas[num1].OpcionRespuesta;
            }
            int num2 = rand.Next(1, 4);
            if (ListaRespuestas[num2].Correcta == false) VecIncorrectas[0] = ListaRespuestas[num2].OpcionRespuesta;
            else
            {
                while (ListaRespuestas[num2].Correcta == true)
                {
                    num2 = rand.Next(1, 4);
                }
                VecIncorrectas[0] = ListaRespuestas[num2].OpcionRespuesta;
            }
            return VecIncorrectas;
        }
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
            int i = 0;
            while (i < _PreguntasRespondidas.Count)
            {
                while (_PreguntaActual == _PreguntasRespondidas[i])
                {
                    i = 0;
                    Random rand = new Random();
                    int num = rand.Next(1, 15);
                    _PreguntaActual = num;
                }
                i++;
            }
        }
    }
    public static Jugador DevolverJugador()
    {
        return _Player;
    }
}