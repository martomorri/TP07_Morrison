using System;
public class Jugador
{
    private int _IdJugador, _PozoGanado; private string _Nombre; private DateTime _FechaHora; private bool _ComodinDobleChance, _Comodin50, _ComodinSaltear;
    public Jugador(int IdJugador, string Nombre, DateTime FechaHora, int PozoGanado, bool ComodinDobleChance, bool Comodin50, bool ComodinSaltear)
    {
        _IdJugador = IdJugador; _Nombre = Nombre; _FechaHora = FechaHora; _PozoGanado = PozoGanado; _ComodinDobleChance = ComodinDobleChance; _Comodin50 = Comodin50; _ComodinSaltear = ComodinSaltear;
    }
    public Jugador()
    {
        _IdJugador = 0; _Nombre = ""; _FechaHora = new DateTime(0,0,0); _PozoGanado = 0; _ComodinDobleChance = true; _Comodin50 = true; _ComodinSaltear = true;
    }
    public int IdJugador
    {
        get { return _IdJugador; }
        set { _IdJugador = value; }
    }
    public string Nombre
    {
        get { return _Nombre; }
        set { _Nombre = value; }
    }
    public DateTime FechaHora
    {
        get { return _FechaHora; }
        set { _FechaHora = value; }
    }
    public int PozoGanado
    {
        get { return _PozoGanado; }
        set { _PozoGanado = value; }
    }
    public bool ComodinDobleChance
    {
        get { return _ComodinDobleChance; }
        set { _ComodinDobleChance = value; }
    }
    public bool Comodin50
    {
        get { return _Comodin50; }
        set { _Comodin50 = value; }
    }
    public bool ComodinSaltear
    {
        get { return _ComodinSaltear; }
        set { _ComodinSaltear = value; }
    }
}