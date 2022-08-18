using System;
public class Pregunta
{
    private int _IdPregunta, _NivelDificultad; private string _TextoPregunta;
    public Pregunta(int IdPregunta, string TextoPregunta, int NivelDificultad)
    {
        _IdPregunta = IdPregunta; _TextoPregunta = TextoPregunta; _NivelDificultad = NivelDificultad;
    }
    public Pregunta()
    {
        _IdPregunta = 0; _TextoPregunta = ""; _NivelDificultad = 0;
    }
    public int IdPregunta
    {
        get { return _IdPregunta; }
        set { _IdPregunta = value; }
    }
    public string TextoPregunta
    {
        get { return _TextoPregunta; }
        set { _TextoPregunta = value; }
    }
    public int NivelDificultad
    {
        get { return _NivelDificultad; }
        set { _NivelDificultad = value; }
    }
}