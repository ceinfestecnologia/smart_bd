/* 
=============================================
Fecha		: 15/01/2021
Responsable	: Reinel José Ochoa Quintero
Descripción	: Listado de motivos tipo para tickets
Email		: reinel.ochoa@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		: 06/02/2021
Responsable	: Reinel José Ochoa Quintero
Descripción	: Agregan columnas de actualización
=============================================
*/
USE BD_TICKET
GO

--CREATE VIEW VW_MOTIVOTIPO
--ALTER VIEW VW_MOTIVOTIPO
--AS

SELECT
mt.ID,
mt.Nombre,
mt.Activo,
BD_EMPLEADO.dbo.FN_NOMBRE_PROCESO(mt.IDProceso) Proceso,
BD_EMPLEADO.dbo.FN_NOMBRE_SUBPROCESO(mt.IDSubProceso) SubProceso,
BD_TICKET.dbo.FN_NOMBRE_SERVICIO(mt.IDServicio) Servicio,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(mt.IDUsuarioRegistra) Registra,
mt.FechaRegistro Creacion,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(mt.IDUsuarioActualiza) Actualiza,
mt.FechaActualizacion Actualizado,
mt.IDProceso,
mt.IDSubProceso,
mt.IDServicio,
(SELECT COUNT(m.ID) FROM BD_TICKET.dbo.VW_MOTIVO_CONSULTA m WHERE m.IDTipo = mt.ID) TotalMotivo
FROM BD_TICKET.dbo.MotivoTipo mt