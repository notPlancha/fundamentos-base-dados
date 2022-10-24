use aluno_105289_flight;
-- 0

-- TODO maybe

-- 1
-- Listar para cada estado o números de voos que o afectaram. Por ordem decrescente de cancelamentos
alter table flights add index ind_airport (DESTINATION_AIRPORT, ORIGIN_AIRPORT);
alter table airports add index ind_iataCode (IATA_CODE);
select a.STATE, count(distinct FLIGHT_NUMBER) cnt
from flights f
    left join airports a on a.IATA_CODE in (f.DESTINATION_AIRPORT, f.ORIGIN_AIRPORT)
group by a.STATE
order by cnt DESC;

select state, count(distinct FLIGHT_NUMBER)
from flights, airports
where IATA_CODE=ORIGIN_AIRPORT or IATA_CODE=DESTINATION_AIRPORT
group by state
order by COUNT(*) desc;

