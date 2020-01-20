select * from products 






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