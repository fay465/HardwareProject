using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace HardwareProject.Models;

public partial class Cliente
{
    public int IdCliente { get; set; }

    public string Rut { get; set; } = null!;

    public string Nombre { get; set; } = null!;

    public string Correo { get; set; } = null!;

    public string? Telefono { get; set; }

    [JsonIgnore]
    public virtual ICollection<Ventum> Venta { get; set; } = new List<Ventum>();
}
