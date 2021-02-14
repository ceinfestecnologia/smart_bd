/* 
=============================================
Fecha		: 25/08/2020
Responsable	: Reinel José Ochoa Quintero
Descripción	: Listado Incidentes
Email		: reinel.ochoa@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		: 
Responsable	: 
Descripción	: 
=============================================
*/
USE BD_TICKET
GO

--CREATE VIEW VW_INCIDENTE
--ALTER VIEW VW_INCIDENTE
--AS

SELECT
i.ID,
i.FechaInicio,
i.HoraInicio,
i.FechaFin,
i.HoraFin,
BD_TICKET.dbo.FN_NOMBRE_TIPOITEMCONFIGURACION(i.IDTipoItem) TipoItemConfiguracion,
BD_TICKET.dbo.FN_NOMBRE_ITEMCONFIGURACION(i.IDItemConfiguracion) ItemConfiguracion,
BD_TICKET.dbo.FN_NOMBRE_ESTADOINCIDENTE(i.IDEstado) Estado,
i.Detalle QueSucedio,
i.QueSeHizo,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(i.IDUsuarioRegistra) Registra,
i.FechaCierre,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(i.IDUsuarioCierre) UsuarioCierre,
i.QueSeRealizo,
i.FechaRegistro Creacion
FROM BD_TICKET.dbo.Incidente i
