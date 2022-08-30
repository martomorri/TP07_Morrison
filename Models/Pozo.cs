using System;

namespace TP7_Morrison.Models;
public class Pozo
{
    private int _Importe; private bool _ValorSeguro;
    public Pozo(int Importe, bool ValorSeguro)
    {
        _Importe = Importe; _ValorSeguro = ValorSeguro;
    }
    public Pozo()
    {
        _Importe = 0; _ValorSeguro = false;
    }
    public int Importe
    {
        get { return _Importe; }
        set { _Importe = value; }
    }
    public bool ValorSeguro
    {
        get { return _ValorSeguro; }
        set { _ValorSeguro = value; }
    }
}