using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace HardwareProject.Models;

public partial class Ventum
{
    public int IdVenta { get; set; }

    public DateOnly Fecha { get; set; }

    public int Cantidad { get; set; }

    public int Total { get; set; }

    public int IdCliente { get; set; }

    public int IdProducto { get; set; }

    [JsonIgnore]
    public virtual Cliente? IdClienteNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Producto? IdProductoNavigation { get; set; } = null!;
}
