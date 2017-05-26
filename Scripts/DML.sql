-- DimLocal
INSERT INTO DimLocal
SELECT DISTINCT 
	ibge, uf, cidade
FROM DadosMicrocefalia	

-- DimTempo e FatoCasoConfirmado
-- FatoCasoConfirmado
DECLARE
	@SemanaInicio				INT,
	@SemanaFim					INT,
	@Mes						INT,
	@DescricaoMes				VARCHAR(50),
	@Data						DATE

-- Inicializa Variáveis
SET LANGUAGE PORTUGUESE

SET @Mes = 1

WHILE (@Mes <= 12)
BEGIN
  IF @Mes < 10
	SET @Data = ('2016-0'+ CAST(@Mes AS VARCHAR(2))+'-01')
  ELSE
	SET @Data = ('2016-'+ CAST(@Mes AS VARCHAR(2))+'-01')

  SELECT 
	@SemanaInicio = DATEPART(WEEK,@Data),
	@SemanaFim = DATEPART(WEEK,EOMONTH(@Data)),
	@DescricaoMes = DATENAME(MONTH, @Data)

	INSERT INTO DimTempo (Ano,Mes)
	VALUES (2016,@DescricaoMes)

	INSERT INTO FatoCasoConfirmado (idTempo, idLocal, TotalCasosConfirmados)
	SELECT
		@Mes,
		ibge,
		SUM(total_confirmado)
	FROM DadosMicrocefalia
	WHERE ((nu_semana >= @SemanaInicio)  AND (nu_semana <= @SemanaFim))
	GROUP BY ibge
  
  SET @Mes = @Mes + 1  
END

--FatoAgenteSaude

-- Janeiro
INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	1, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Jan2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Jan2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Jan2016.UF AND DimLocal.Cidade = (AgenteSaude_Jan2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	2, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Fev2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Fev2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Fev2016.UF AND DimLocal.Cidade = (AgenteSaude_Fev2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	3, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Mar2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Mar2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Mar2016.UF AND DimLocal.Cidade = (AgenteSaude_Mar2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	4, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Abr2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Abr2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Abr2016.UF AND DimLocal.Cidade = (AgenteSaude_Abr2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	5, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Mai2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Mai2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Mai2016.UF AND DimLocal.Cidade = (AgenteSaude_Mai2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

--Junho
INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	6, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Jun2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Jun2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Jun2016.UF AND DimLocal.Cidade = (AgenteSaude_Jun2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	7, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Jul2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Jul2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Jul2016.UF AND DimLocal.Cidade = (AgenteSaude_Jul2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	8, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Ago2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Ago2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Ago2016.UF AND DimLocal.Cidade = (AgenteSaude_Ago2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	9, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Set2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Set2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Set2016.UF AND DimLocal.Cidade = (AgenteSaude_Set2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	10, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Out2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Out2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Out2016.UF AND DimLocal.Cidade = (AgenteSaude_Out2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	11, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Nov2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Nov2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Nov2016.UF AND DimLocal.Cidade = (AgenteSaude_Nov2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal

--Dezembro
INSERT INTO FatoAgenteSaude (idTempo, idLocal, TotalAgentes)
SELECT
	12, 
	DimLocal.idLocal,
	COUNT(AgenteSaude_Dez2016.nome) AS TotalAgentesSaude 
FROM AgenteSaude_Dez2016
INNER JOIN DimLocal ON DimLocal.UF = AgenteSaude_Dez2016.UF AND DimLocal.Cidade = (AgenteSaude_Dez2016.Município COLLATE Latin1_General_CI_AI)
GROUP BY DimLocal.idLocal