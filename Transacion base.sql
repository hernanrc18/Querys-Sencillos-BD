select * from products 






USE NorthWind
DECLARE @Error int
--Declaramos una variable que utilizaremos para almacenar un posible código de error

BEGIN TRAN
--Iniciamos la transacción
UPDATE Products SET UnitPrice=20 WHERE ProductName ='ikura'
--Ejecutamos la primera sentencia
SET @Error=@@ERROR
--Si ocurre un error almacenamos su código en @Error
--y saltamos al trozo de código que deshara la transacción. Si, eso de ahí es un 
--GOTO, el demonio de los programadores, pero no pasa nada por usarlo
--cuando es necesario
IF (@Error<>0) GOTO TratarError

--Si la primera sentencia se ejecuta con éxito, pasamos a la segunda
UPDATE Products SET UnitPrice=20 WHERE ProductName='Chang'
SET @Error=@@ERROR
--Y si hay un error hacemos como antes
IF (@Error<>0) GOTO TratarError

--Si llegamos hasta aquí es que los dos UPDATE se han completado con 
--éxito y podemos "guardar" la transacción en la base de datos
COMMIT TRAN

TratarError:
--Si ha ocurrido algún error llegamos hasta aquí
If @@Error<>0 
	BEGIN
	PRINT 'Ha ecorrido un error. Abortamos la transacción'
	--Se lo comunicamos al usuario y deshacemos la transacción
	--todo volverá a estar como si nada hubiera ocurrido
	ROLLBACK TRAN
	END