
SELECT 
    'Cuidad_Bolivar' AS Fuente,
    SUM([Población Hombres]) AS Poblacion_Total_Hombres
FROM Cuidad_Bolivar.dbo.Poblacion;


SELECT 
    'DATA_PERU' AS Fuente,
    SUM([Poblacion_Hombres]) AS Poblacion_Total_Hombres
FROM DATA_PERU.dbo.PoblacionDistrital;


SELECT 
    
   a.Poblacion_Total as Poblacion_Total_Data_PERU,
   b.[Población Total] as Poblacion_Total_Cuidad_Bolivar
FROM 
    DATA_PERU.dbo.PoblacionDistrital a
JOIN 
    Cuidad_Bolivar.dbo.Poblacion b ON a.Poblacion_Total = b.[Población Total];  


SELECT 
	ID,
	
    Poblacion_Hombres,
	Poblacion_Mujeres,
	Poblacion_Total,
  
	'DATA_PERU' AS Fuente
FROM 
    DATA_PERU.dbo.PoblacionDistrital

UNION ALL

SELECT 
	id_Poblacion,
	
	[Población Mujeres],
	[Población Total],
	[Población Hombres],	
    'Cuidad_Bolivar' AS Fuente
FROM 
    Cuidad_Bolivar.dbo.Poblacion;




SELECT 
   
    CB.[Población Total] AS Poblacion_total_Cuidad_Bolivar,
    DP.Poblacion_Total AS Poblacion_total_DATA_PERU
FROM Cuidad_Bolivar.dbo.Poblacion AS CB
LEFT JOIN DATA_PERU.dbo.PoblacionDistrital AS DP 
    ON CB.[Población Total] = DP.Poblacion_Total;

SELECT 
    CB.id_Poblacion,
    CB.[Población Total],
	CB.[Tasa  de Crecimiento de la Población],
    DP.Poblacion_Total AS Poblacion_Total_DATA_PERU,
	DP.ID AS ID_DATA_PERU, 	
	DP.Densidad_Poblacional AS Densidad_Poblacional_DATA_PERU	
FROM Cuidad_Bolivar.dbo.Poblacion AS CB
INNER JOIN DATA_PERU.dbo.PoblacionDistrital AS DP
    ON CB.[Población Total] = DP.Poblacion_Total
    AND CB.[Tasa  de Crecimiento de la Población] = DP.Densidad_Poblacional
	AND CB.id_Poblacion = DP.ID;

