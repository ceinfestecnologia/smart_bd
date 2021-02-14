/* 
=============================================
Fecha		: 06/02/2021
Responsable	: Reinel Jos� Ochoa Quintero
Descripci�n	: Listado de motivos
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
--CREATE VIEW VW_MOTIVO
--ALTER VIEW VW_MOTIVO
--AS

SELECT
m.ID,
m.Nombre,
BD_TICKET.dbo.FN_NOMBRE_MOTIVOTIPO(m.IDTipo) Tipo,
m.Activo,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(m.IDUsuarioRegistra) Registra,
m.FechaRegistro Creacion,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(m.IDUsuarioActualiza) Actualiza,
m.FechaActualizacion Actualizado
FROM BD_TICKET.dbo.Motivo m