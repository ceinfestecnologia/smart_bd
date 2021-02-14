/* 
=============================================
Fecha		: 18/12/2020
Responsable	: Reinel Jos� Ochoa Quintero
Descripci�n	: Listado de servicios
Email		: reinel.ochoa@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		: 
Responsable	: 
Descripci�n	: 
=============================================
*/
USE BD_TICKET
GO

--CREATE VIEW VW_SERVICIO
--ALTER VIEW VW_SERVICIO
--AS
SELECT
s.ID,
s.Nombre,
s.Activo,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(s.IDUsuarioRegistra) Registra,
s.FechaRegistro
FROM BD_TICKET.dbo.Servicio s