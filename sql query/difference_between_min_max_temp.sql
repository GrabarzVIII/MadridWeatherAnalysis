select
	CET
	,min_temperatureC 
	,mean_temperatureC 
	,max_temperatureC 
	,max_temperatureC - min_temperatureC 
from daily_weather dw
where dw.mean_temperatureC in 
(
select 
	max(mean_temperatureC) as max_mean_temp
from daily_weather
)
or 
dw.max_temperatureC in 
(
select
	max(max_temperatureC) as max_max_temp
from daily_weather
)
or
dw.mean_temperatureC in 
(
select 
	min(mean_temperatureC) as min_mean_temp
from daily_weather
)
or
dw.min_temperatureC in
(
select
	min(min_temperatureC) as min_min_temp
from daily_weather
)
order by 5 desc
	
	



 