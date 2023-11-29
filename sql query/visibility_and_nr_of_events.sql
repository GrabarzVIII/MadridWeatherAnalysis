select 
	distinct(events)
	,round(avg(mean_visibilityKm), 2)		as avg_visibility
	,count(events)							as nr_of_events
from daily_weather
where mean_temperatureC < (
select 
	avg(mean_temperatureC) 
from daily_weather
)
group by 1
order by 2

