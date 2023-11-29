with
	month_rainy_days as
	(
	select
		year(CET)		as year_nr
		,month(CET)		as month_nr
		,count(events) 	as nr_of_rainy_days
	from daily_weather 
	where events in ('Rain','Rain-Snow','Fog-Rain','Rain-Thunderstorm','Rain-Hail-Thunderstorm',
	'Fog-Rain-Thunderstorm','Fog-Rain-Snow','Rain-Snow-Thunderstorm','Rain-Hail')
	group by 1, 2
	),
	days_in_month as 
	(
	select
		year(CET)		as year_nr
		,month(CET)		as month_nr
		,count(CET)		as nr_of_days
	from daily_weather
	group by 1, 2
	)
select 
	mrd.year_nr
	,mrd.month_nr
	,round((mrd.nr_of_rainy_days/dim.nr_of_days) * 100,2) as prc_of_rainy_days_in_month
from month_rainy_days mrd
join days_in_month dim on dim.year_nr = mrd.year_nr and dim.month_nr = mrd.month_nr
order by 1, 2


	
	

