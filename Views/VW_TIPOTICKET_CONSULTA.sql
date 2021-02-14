/* 
=============================================
Fecha		: 14/02/2020
Responsable	: Reinel José Ochoa
Descripción	: Listado Tipo Ticket
Email		: reinel.ochoa@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		: 19/12/2020
Responsable	: Reinel José Ochoa Quintero
Descripción	: Permitir la visualización de todos los tipos de Ticket
=============================================
Fecha		: 28/01/2021
Responsable	: Reinel José Ochoa Quintero
Descripción	: agrega columna de activo
=============================================
Fecha		: 04/02/2021
Responsable	: Reinel José Ochoa Quintero
Descripción	: agrega ítem de consulta
=============================================
Fecha		: 07/02/2021
Responsable	: Reinel José Ochoa Quintero
Descripción	: agrega ítems de mejora y capacitación
=============================================
*/
USE BD_TICKET
GO

--CREATE VIEW VW_TIPOTICKET_CONSULTA
--ALTER VIEW VW_TIPOTICKET_CONSULTA
--AS

SELECT
t.ID,
CASE
	-- Incidente
	WHEN t.ID = 3 THEN CONCAT(t.Nombre,': He ocurrido un Error que no permite seguir con la actividad')
	-- Solicitud
	WHEN t.ID = 4 THEN CONCAT(t.Nombre,': Requiero acceso, usuario o configuración a un servicio')
	-- Requerimiento
	WHEN t.ID = 5 THEN CONCAT(t.Nombre,': Desarrollo de funcionalidad que no existe en plataforma')
	-- Consulta
	WHEN t.ID = 6 THEN CONCAT(t.Nombre,': Pregunta que pudo ser direccionada al proceso encargado')
	-- Mejora
	WHEN t.ID = 7 THEN CONCAT(t.Nombre,': Ajuste a funcionalidad ya existen en plataforma')
	-- Capacitación
	WHEN t.ID = 8 THEN CONCAT(t.Nombre,': ofrecida como apoyo al proceso o implementación')
	ELSE t.Nombre
END NombreCalculado,
t.Activo
FROM BD_TICKET.dbo.TipoTicket t