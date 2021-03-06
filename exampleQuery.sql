SELECT sub2.[ticker] as Ticker
      ,sub2.[name] as [Name] 
      ,sub2.[date] as [Date]
      ,log(sub2.[price]/sub2.[lastPrice]) as logPriceChange
FROM 
(SELECT sub1.[ticker]
      ,sub1.[name]
      ,sub1.[date]
      ,sub1.[price]
	  ,sub1.[lastPrice] 
FROM
 
(	SELECT [ticker]
		,[name]
		,[date]
		,[price]
		,[lastPrice] = LAG([price],1) OVER (PARTITION BY ticker ORDER BY [date])
	FROM [master].[dbo].[spx100data]	) sub1 
 
 WHERE sub1.lastprice IS NOT NULL) sub2

