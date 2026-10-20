CREATE DATABASE [tiendahardwaredb]
GO
USE [tiendahardwaredb]
GO

CREATE TABLE [dbo].[Categoria](
    [id_categoria] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](150) NOT NULL,
    [descripcion] [varchar](max) NULL,
    CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED ([id_categoria] ASC)
)
GO

CREATE TABLE [dbo].[Marca](
    [id_marca] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](100) NOT NULL,
    [pais_origen] [varchar](100) NULL,
    CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED ([id_marca] ASC)
)
GO

CREATE TABLE [dbo].[Producto](
    [id_producto] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](150) NOT NULL,
    [codigo_sku] [varchar](50) NOT NULL,
    [precio] [int] NOT NULL,
    [stock] [int] NOT NULL,
    [id_categoria] [int] NOT NULL,
    [id_marca] [int] NOT NULL,
    CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED ([id_producto] ASC)
)
GO

CREATE TABLE [dbo].[Cliente](
    [id_cliente] [int] IDENTITY(1,1) NOT NULL,
    [rut] [varchar](20) NOT NULL,
    [nombre] [varchar](150) NOT NULL,
    [correo] [varchar](150) NOT NULL,
    [telefono] [varchar](50) NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED ([id_cliente] ASC)
)
GO

CREATE TABLE [dbo].[Venta](
    [id_venta] [int] IDENTITY(1,1) NOT NULL,
    [fecha] [date] NOT NULL,
    [cantidad] [int] NOT NULL,
    [total] [int] NOT NULL,
    [id_cliente] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
    CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED ([id_venta] ASC)
)
GO

CREATE TABLE [dbo].[Rol](
    [id_rol] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](50) NOT NULL,
    CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED ([id_rol] ASC)
)
GO

CREATE TABLE [dbo].[Usuario](
    [id_user] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](150) NOT NULL,
    [email] [varchar](150) NOT NULL,
    [password] [varchar](max) NOT NULL,
    [id_rol] [int] NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([id_user] ASC)
)
GO

-- Llaves foráneas (Foreign Keys)
ALTER TABLE [dbo].[Producto] WITH CHECK ADD CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Producto] WITH CHECK ADD CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id_marca])
GO
ALTER TABLE [dbo].[Venta] WITH CHECK ADD CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Venta] WITH CHECK ADD CONSTRAINT [FK_Venta_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Usuario] WITH CHECK ADD CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rol] ([id_rol])
GO

-- Datos iniciales de prueba
SET IDENTITY_INSERT [dbo].[Rol] ON 
INSERT [dbo].[Rol] ([id_rol], [nombre]) VALUES (1, N'Admin')
INSERT [dbo].[Rol] ([id_rol], [nombre]) VALUES (2, N'Vendedor')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO

SET IDENTITY_INSERT [dbo].[Categoria] ON 
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion]) VALUES (1, N'Tarjetas de Video', N'GPUs dedicadas')
INSERT [dbo].[Categoria] ([id_categoria], [nombre], [descripcion]) VALUES (2, N'Procesadores', N'CPUs escritorio')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO

SET IDENTITY_INSERT [dbo].[Marca] ON 
INSERT [dbo].[Marca] ([id_marca], [nombre], [pais_origen]) VALUES (1, N'AMD', N'Estados Unidos')
INSERT [dbo].[Marca] ([id_marca], [nombre], [pais_origen]) VALUES (2, N'ASUS', N'Taiwán')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO

SET IDENTITY_INSERT [dbo].[Producto] ON 
INSERT [dbo].[Producto] ([id_producto], [nombre], [codigo_sku], [precio], [stock], [id_categoria], [id_marca]) 
VALUES (1, N'Ryzen 5 7600X', N'CPU-7600X', 219990, 15, 2, 1)
INSERT [dbo].[Producto] ([id_producto], [nombre], [codigo_sku], [precio], [stock], [id_categoria], [id_marca]) 
VALUES (2, N'Radeon RX 9060 XT 16GB', N'GPU-9060XT', 429990, 8, 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO

SET IDENTITY_INSERT [dbo].[Cliente] ON 
INSERT [dbo].[Cliente] ([id_cliente], [rut], [nombre], [correo], [telefono]) 
VALUES (1, N'19876543-2', N'Matías Rojas', N'matias@correo.cl', N'+56912345678')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO