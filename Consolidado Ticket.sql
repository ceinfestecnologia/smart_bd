SELECT 
t.IDTicket,
ISNULL(BD_MAESTRA.dbo.FN_NOMBRE_REGIONAL(t.IDRegional),'') Regional,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_FUENTE(t.IdFuente),'') Fuente,
ISNULL(BD_USUARIO.dbo.FN_NOMBRE_AREAUSUARIO(t.Idarea),'') Area,
ISNULL(BD_USUARIO.dbo.FN_NOMBRE_CARGO(t.IDCargo),'') Cargo,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_ESTADO(t.IDEstado),'') Estado,
ISNULL(BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IdUsuarioSolicita),'') Solicita,
CONVERT(DATE,t.FechaRegistro) FechaRegistro,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_CLASIFICACION(t.IDClasificacion),'') Clasificacion,
CONVERT(DATE,t.FechaAsignacion) FechaAsignacion,
CONVERT(DATE,t.FechaObjetivo) FechaObjetivo,
IIF(t.FechaAsignacion IS NOT NULL,DATEDIFF(DAY,t.FechaRegistro,t.FechaAsignacion),NULL) DiaSinAsignar,
ISNULL(BD_USUARIO.dbo.FN_NOMBRE_ASESOR(t.IDUsuarioSoluciona),'') Soluciona,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_MOTIVOTIPO(t.IDMotivoTipo),'') MotivoTipo,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_MOTIVO(t.IDMotivo),'') Tipo,
ISNULL(BD_TICKET.dbo.FN_NOMBRE_COMPLEJIDAD(t.IDComplejidad),'') Complejidad,
CONVERT(DATE,t.FechaSolucion) FechaSolucion
FROM BD_TICKET.dbo.Ticket t