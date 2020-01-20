CREATE PROCEDURE SP_Prueba1
AS
PRINT 'HOLA MUNDO'

EXECUTE SP_Prueba1 

CREATE PROC SP_Consulta
AS
SELECT * FROM productos 
WHERE cod_prod='A005'

EXEC SP_Consulta 

CREATE PROC SP_RestarExistencia
@CodProd as varchar(4),
@Cantidad as int
AS
UPDATE productos SET existencia=existencia-@Cantidad 
WHERE cod_prod=@CodProd 

SELECT * FROM productos 

EXEC SP_RestarExistencia 'A003',45

CREATE PROC SP_SumarExistencia
@CodProd as varchar(4),
@Cantidad as int
AS
UPDATE productos SET existencia=existencia+@Cantidad 
WHERE cod_prod=@CodProd 

exec SP_SumarExistencia 'A009',100