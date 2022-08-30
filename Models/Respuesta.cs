using System;

namespace TP7_Morrison.Models;
public class Respuesta
{
    private int _IdRespuesta, _IdPregunta; private char _OpcionRespuesta; private string _TextoRespuesta; private bool _Correcta;
    public Respuesta(int IdRespuesta, int IdPregunta, char OpcionRespuesta, string TextoRespuesta, bool Correcta)
    {
        _IdRespuesta = IdRespuesta; _IdPregunta = IdPregunta; _OpcionRespuesta = OpcionRespuesta; _TextoRespuesta = TextoRespuesta; _Correcta = Correcta;
    }
    public Respuesta()
    {
        _IdRespuesta = 0; _IdPregunta = 0; _OpcionRespuesta = ' '; _TextoRespuesta = ""; _Correcta = false;
    }
    public int IdRespuesta
    {
        get { return _IdRespuesta; }
        set { _IdRespuesta = value; }
    }
    public int IdPregunta
    {
        get { return _IdPregunta; }
        set { _IdPregunta = value; }
    }
    public char OpcionRespuesta
    {
        get { return _OpcionRespuesta; }
        set { _OpcionRespuesta = value; }
    }
    public string TextoRespuesta
    {
        get { return _TextoRespuesta; }
        set { _TextoRespuesta = value; }
    }
    public bool Correcta
    {
        get { return _Correcta; }
        set { _Correcta = value; }
    }
}