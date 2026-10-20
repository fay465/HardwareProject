using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace HardwareProject.Models;

public partial class Producto
{
    public int IdProducto { get; set; }

    public string Nombre { get; set; } = null!;

    public string CodigoSku { get; set; } = null!;

    public int Precio { get; set; }

    public int Stock { get; set; }

    public int IdCategoria { get; set; }

    public int IdMarca { get; set; }

    [JsonIgnore]
    public virtual Categorium? IdCategoriaNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual Marca? IdMarcaNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<Ventum> Venta { get; set; } = new List<Ventum>();
}
