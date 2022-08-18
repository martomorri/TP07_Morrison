using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Dapper;
public static class JuegoQQSM
{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-030; DataBase=JuegoQQSM; Trusted_Connection=True;";
    private static int _PreguntaActual, _PosicionPozo, _PozoAcumuladoSeguro, _PozoAcumulado; private static char _RespuestaCorrectaActual; private static bool _Comodin5050, _ComodinDobleChance, _ComodinSaltearPregunta; private static List<Pozo> _ListaPozo; private static Jugador _Player;
    public static void IniciarJuego(string Nombre, DateTime FechaHora)
    {
        _PreguntaActual = 1; _RespuestaCorrectaActual = ' '; _PosicionPozo = 1; _PozoAcumuladoSeguro = 0; _PozoAcumulado = 0; _Comodin5050 = true; _ComodinDobleChance = true; _ComodinSaltearPregunta = true;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "CrearJugador";
            db.Execute(sp, new {@Nombre = Nombre, @FechaHora = FechaHora}, commandType: CommandType.StoredProcedure);
        }
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        _PreguntaActual++;
        Pregunta pregunta = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarPreguntasXID";
            pregunta = db.QueryFirstOrDefault(sp, new {@IdPregunta = _PreguntaActual}, commandType: CommandType.StoredProcedure);
        }
        return pregunta;
    }
}