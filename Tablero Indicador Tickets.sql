SELECT 
BD_MAESTRA.dbo.FN_NOMBRE_REGIONAL(d.IDRegional) Regional,
COUNT(d.Cerrado) Total,
SUM(d.Asignado) Asignado,
SUM(d.Cerrado) Cerrado,
IIF(COUNT(d.Cerrado) = 0,0,ROUND(CONVERT(FLOAT,(SUM(d.Asignado))*100/CONVERT(FLOAT,COUNT(d.Cerrado))),2)) PorAsignado,
IIF(COUNT(d.Cerrado) = 0,0,ROUND(CONVERT(FLOAT,(SUM(d.Cerrado))*100/CONVERT(FLOAT,COUNT(d.Cerrado))),2)) PorCerrado
FROM
(
	SELECT
	t.IDRegional,
	IIF(t.IDEstado = 3,1,0) Asignado,
	IIF(t.IDEstado = 4,1,0) Cerrado
	FROM BD_TICKET.dbo.Ticket t
	WHERE MONTH(t.FechaEnvio) = 7 and YEAR(t.FechaEnvio) = 2017
) AS d
GROUP BY d.IDRegional