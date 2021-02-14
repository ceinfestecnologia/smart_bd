/* 
=============================================
Fecha		: 20/02/2018
Responsable	: Reinel José Ochoa
Descripción	: Listado de Tickets registrados
Email		: tecnologia@ceinfes.com
=============================================
CONTROL DE CAMBIOS
=============================================
Fecha		: 07/02/2020
Responsable	: Reinel José Ochoa Quintero
Descripción	: Agrega columna IDTipo
=============================================
Fecha		: 13/02/2020
Responsable	: Reinel José Ochoa Quintero
Descripción	: Agrega columna días atraso
=============================================
*/
USE BD_TICKET
GO

--ALTER VIEW VW_TICKET
--AS

SELECT
t.IDTicket ID,
BD_TICKET.dbo.FN_NOMBRE_TIPOTICKET(t.IDTipo) Tipo,
BD_TICKET.dbo.FN_NOMBRE_CANAL(t.IDCanal) Canal,
BD_TICKET.dbo.FN_NOMBRE_FUENTE(t.IDFuente) Fuente,
BD_TICKET.dbo.FN_NOMBRE_TIPOUSUARIO(t.IDTipoUsuario) TipoUsuario,
t.Solicita,
t.Telefono,
t.Email,
t.Usuario,
BD_MAESTRA.dbo.FN_NOMBRE_REGIONAL(t.IDRegional) RegionalOrigen,
BD_EMPLEADO.dbo.FN_NOMBRE_PROCESO(t.IDProceso) ProcesoOrigen,
BD_EMPLEADO.dbo.FN_NOMBRE_SUBPROCESO(t.IDSubProceso) SubProcesoOrigen,
BD_MAESTRA.dbo.FN_NOMBRE_REGIONAL(t.IDRegionalDestino) RegionalDestino,
BD_EMPLEADO.dbo.FN_NOMBRE_PROCESO(t.IDProcesoDestino) ProcesoDestino,
BD_EMPLEADO.dbo.FN_NOMBRE_SUBPROCESO(t.IDSubProcesoDestino) SubProcesoDestino,
BD_MAESTRA.dbo.FN_NOMBRE_COLEGIO(t.IDColegio) Colegio,
BD_MAESTRA.dbo.FN_CODIGO_COLEGIO(t.IDColegio) Codigo,
BD_MAESTRA.dbo.FN_CALENDARIO_COLEGIO(t.IDColegio) Calendario,
t.OtroColegio,
t.Asunto,
t.Descripcion,
t.DescripcionPara,
t.CriterioAceptacion,
BD_TICKET.dbo.FN_NOMBRE_SERVICIO(t.IDServicio) Servicio,
BD_TICKET.dbo.FN_NOMBRE_MOTIVOTIPO(t.IDMotivoTipo) Categoria,
BD_TICKET.dbo.FN_NOMBRE_MOTIVO(t.IDMotivo) Motivo,
BD_PRODUCTO.dbo.FN_NOMBRE_LINEAPRODUCTO(t.IDLineaProducto) LineaProducto,
BD_PRODUCTO.dbo.FN_NOMBRE_CATEGORIAMATERIAL(t.IDCategoriaMaterial) CategoriaMaterial,
BD_TICKET.dbo.FN_NOMBRE_ESTADO(t.IDEstado) Estado,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioSolicita) UsuarioSolicita,
BD_CEINFES.dbo.FN_NOMBRE_DOCENTE(t.IDDocente) Docente,
BD_CEINFES.dbo.FN_NOMBRE_AUXILIAR(t.IDAuxiliar) Auxiliar,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioRegistra) Registra,
t.FechaRegistro,
t.FechaEnvio,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioAsignacion) Asigna,
t.FechaAsignacion,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioAsignado) Asignado,
t.FechaObjetivo,
CASE WHEN IDEstado = 3 THEN DATEDIFF(DAY,CONVERT(DATE,t.FechaObjetivo),CONVERT(DATE,GETDATE())) END DiaAtraso,
0 Salud,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioSoluciona) Soluciona,
t.FechaSolucion,
t.Solucion,
t.NroHoraSolucion,
BD_TICKET.dbo.FN_NOMBRE_PRIORIDAD(t.IDPrioridad) Prioridad,
BD_TICKET.dbo.FN_NOMBRE_COMPLEJIDAD(t.IDComplejidad) Complejidad,
BD_TICKET.dbo.FN_NOMBRE_CLASIFICACION(t.IDClasificacion) Clasificacion,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioDevolucion) Devuelve,
t.FechaDevolucion,
BD_TICKET.dbo.FN_NOMBRE_MOTIVODEVOLUCION(t.IDMotivoDevolucion) MotivoDevolucion,
MotivoDevolucion DetalleDevolucion,
BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioValida) Valida,
t.FechaCierreSolicita,
t.ObservacionCierreSolicita,
t.IDTipo,
t.IDRegional IDRegionalOrigen,
t.IDRegionalDestino,
t.IDEstado,
t.IDUsuarioSolicita,
t.IDDocente,
t.IDAuxiliar
FROM BD_TICKET.dbo.Ticket t