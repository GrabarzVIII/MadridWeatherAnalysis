select 
	year(CET)
	,month(CET)
	,avg(mean_temperatureC) 
from daily_weather dw 
group by 1, 2
order by 1, 2