using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace HardwareProject.Models;

public partial class Usuario
{
    public int IdUser { get; set; }

    public string Nombre { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int IdRol { get; set; }

    [JsonIgnore]
    public virtual Rol? IdRolNavigation { get; set; } = null!;
}
