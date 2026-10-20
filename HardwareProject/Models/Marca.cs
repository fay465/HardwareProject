using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace HardwareProject.Models;

public partial class Marca
{
    public int IdMarca { get; set; }

    public string Nombre { get; set; } = null!;

    public string? PaisOrigen { get; set; }

    [JsonIgnore]
    public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
}
