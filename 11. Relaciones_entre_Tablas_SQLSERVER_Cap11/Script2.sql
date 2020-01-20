CREATE DATABASE Ventas
ON PRIMARY 
(NAME = 'Ventas', 
FILENAME = 'C:\VentasData.mdf', 
SIZE = 10, 
MAXSIZE = 50, 
FILEGROWTH = 5) 

LOG ON 
(NAME = 'VentasLog', 
FILENAME = 'C:\VentasLog.ldf', 
SIZE = 5, 
MAXSIZE = 25, 
FILEGROWTH = 5);

GO
use Ventas 
Create table Productos
(
Cod varchar(4) primary key not null,
Nom_Prod varchar(50) not null,
)
GO
Create table Facturar
(
Fecha date not null,
nFactura  int primary key not null,
Doc_Identidad int not null,
Nom_Cliente varchar(50) not null,
)
GO
Create table Detalle
(
Cod varchar(4) not null,
nFactura  int not null,
Cantidad int not null,
Precio money not null,
Importe money not null,
)


