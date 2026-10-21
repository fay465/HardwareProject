# Sistema de Inventario y Ventas - Tienda de Hardware (API REST)

API RESTful desarrollada en **ASP.NET Core (.NET 10.0)** conectada a **SQL Server** mediante **Entity Framework Core**, diseñada para gestionar el catálogo de productos, stock, clientes, ventas y control de acceso de una tienda de hardware.

## Datos Académicos
* **Estudiante:** Fabián Lagos
* **Asignatura:** Construcción de Software
* **Profesor:** Enso Guidotti

---

## Tecnologías y Paquetes Utilizados
* **Framework:** ASP.NET Core Web API (.NET 10.0)
* **Base de Datos:** Microsoft SQL Server (`SQLEXPRESS`)
* **ORM:** Entity Framework Core (`Database First` con `Scaffold-DbContext`)
* **Seguridad:** Autenticación mediante **JWT (JSON Web Token)** y encriptación de contraseñas con **BCrypt.Net-Next**
* **Documentación y Pruebas:** Swagger UI / OpenAPI (`Swashbuckle.AspNetCore`)

---

## Modelo de Base de Datos (`tiendahardwaredb`)

El sistema se compone de las **5 entidades principales del caso de negocio**, complementadas con **2 tablas adicionales de seguridad** (`Rol` y `Usuario`) para permitir el inicio de sesión y la protección de rutas mediante tokens JWT:

1. **`Categoria`**: Clasificación de los componentes (`id_categoria`, `nombre`, `descripcion`).
2. **`Marca`**: Fabricantes de hardware (`id_marca`, `nombre`, `pais_origen`).
3. **`Producto`**: Catálogo principal con control de precios y existencias (`id_producto`, `nombre`, `codigo_sku`, `precio`, `stock`, `id_categoria`, `id_marca`).
4. **`Cliente`**: Registro de compradores (`id_cliente`, `rut`, `nombre`, `correo`, `telefono`).
5. **`Venta`**: Registro de transacciones asociadas a clientes y productos (`id_venta`, `fecha`, `cantidad`, `total`, `id_cliente`, `id_producto`).
6. **`Rol`**: Niveles de acceso del sistema (`Admin` y `Vendedor`).
7. **`Usuario`**: Cuentas de acceso con contraseña hasheada mediante BCrypt y rol asignado.

---

## Endpoints Principales

| Recurso | Ruta Base | Seguridad | Descripción |
| :--- | :--- | :--- | :--- |
| **Autenticación** | `POST /api/Usuarios/login` | Público | Valida credenciales con BCrypt y retorna el Token JWT. |
| **Usuarios** | `/api/Usuarios` | Público / CRUD | Registro de usuarios (encripta clave automáticamente) y gestión. |
| **Roles** | `/api/Roles` | Público | Consulta y gestión de roles del sistema. |
| **Productos** | `/api/Productos` | `[Authorize]` | CRUD completo del inventario de hardware (requiere Token JWT). |
| **Categorías** | `/api/Categorias` | `[Authorize]` | CRUD de categorías de productos (requiere Token JWT). |
| **Marcas** | `/api/Marcas` | Público | CRUD de marcas fabricantes. |
| **Clientes** | `/api/Clientes` | Público | CRUD de clientes de la tienda. |
| **Ventas** | `/api/Ventas` | Público | Registro y consulta de ventas realizadas. |

---

## Instrucciones de Ejecución

1. **Base de Datos:** Abrir **SQL Server Management Studio (SSMS)** y ejecutar el script `tiendahardwaredb.sql` incluido en el repositorio para crear la base de datos, las tablas y los registros iniciales de prueba.
2. **Cadena de Conexión:** Verificar en `appsettings.json` que la cadena `"MiConexion"` apunte a la instancia local (`Server=.\SQLEXPRESS;Database=tiendahardwaredb;...`).
3. **Ejecución:** Abrir la solución en **Visual Studio**, compilar y ejecutar el proyecto (`http`).
4. **Pruebas con JWT en Swagger:**
   * Crear un usuario en `POST /api/Usuarios` (la contraseña se guardará encriptada).
   * Iniciar sesión en `POST /api/Usuarios/login` ingresando `email` y `pass`.
   * Copiar el token devuelto, presionar el botón **Authorize** en la esquina superior derecha de Swagger, pegar el token y ejecutar las peticiones en `/api/Productos` o `/api/Categorias`.
