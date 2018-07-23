SELECT [FlightNumber]
	,[1] [SUN]
	,[2] [MON]
	,[3] [TUE]
	,[4] [WED]
	,[5] [THU]
	,[6] [FRI]
	,[7] [SAT]
FROM
(
	SELECT a.[FlightNumber]
		,a.[FlightDate]
		,DATEPART(WEEKDAY,a.[FlightDate]) [Week]
	FROM [Flight].[FlightSchedules] a
	WHERE a.[FlightDate] BETWEEN '2018-06-01' AND '2018-08-31'
) As [Schedules]
PIVOT
(
	COUNT([FlightDate]) FOR [Week] IN
	(
		[1],[2],[3],[4],[5],[6],[7]
	)
) As [Pivot]