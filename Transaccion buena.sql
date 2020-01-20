https://www.manualsqlserver.com/

https://www.w3schools.com/sql/default.asp

select convert(Nvarchar(2), EmployeeID) + LastName + FirstName from Employees
//store procedure con un parametro
CREATE PROCEDURE Selecciona2 @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
Go
exec Selecciona2 @City = 'London'

//Vista
CREATE VIEW [mexico Customers] AS
SELECT City, ContactName
FROM Customers
WHERE Country = 'Mexico'

SELECT * FROM [mexico Customers];


create view vista05 as
select ProductID,ProductName,UnitPrice from Products where ProductName='tofu';

select * from [vista05]

Create view VistaProductosDescontinuados
As
Select P.ProductID As 'C�digo', P.ProductName As 'Descripci�n',
P.UnitPrice As 'Precio', P.UnitsInStock As 'Stock',
P.UnitsInStock As 'En Orden'
from Products As P
where P.Discontinued = 1
go

select * from [VistaProductosDescontinuados]

USE NorthWind
DECLARE @Error int
--Declaramos una variable que utilizaremos para almacenar un posible c�digo de error

BEGIN TRAN
--Iniciamos la transacci�n
UPDATE Products SET UnitPrice=20 WHERE ProductName ='ikura'
--Ejecutamos la primera sentencia
SET @Error=@@ERROR
--Si ocurre un error almacenamos su c�digo en @Error
--y saltamos al trozo de c�digo que deshara la transacci�n. Si, eso de ah� es un 
--GOTO, el demonio de los programadores, pero no pasa nada por usarlo
--cuando es necesario
IF (@Error<>0) GOTO TratarError

--Si la primera sentencia se ejecuta con �xito, pasamos a la segunda
UPDATE Products SET UnitPrice=20 WHERE ProductName='Chang'
SET @Error=@@ERROR
--Y si hay un error hacemos como antes
IF (@Error<>0) GOTO TratarError

--Si llegamos hasta aqu� es que los dos UPDATE se han completado con 
--�xito y podemos "guardar" la transacci�n en la base de datos
COMMIT TRAN

TratarError:
--Si ha ocurrido alg�n error llegamos hasta aqu�
If @@Error<>0 
	BEGIN
	PRINT 'Ha ecorrido un error. Abortamos la transacci�n'
	--Se lo comunicamos al usuario y deshacemos la transacci�n
	--todo volver� a estar como si nada hubiera ocurrido
	ROLLBACK TRAN
	END


CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

exec SelectAllCustomers

select  *  from  sys.triggers
go

--creacion de vista provedores y sus pedidos
CREATE VIEW VIEW_SUPPLIER_PRODUCS
AS
SELECT S.SUPPLIERID,S.COMPANYNAME,S.CONTACTNAME
,P.PRODUCTID,P.PRODUCTNAME, P.UNITPRICE
FROM SUPPLIERS AS S INNER JOIN PRODUCTS AS P
ON
S.SUPPLIERID=P.SUPPLIERID
GO

select * from [VIEW_SUPPLIER_PRODUCS]