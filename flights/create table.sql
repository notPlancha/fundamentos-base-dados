create database aluno_105289_flight;
use aluno_105289_flight;
create table flights (AIRLINE varchar(9), FLIGHT_NUMBER int, ORIGIN_AIRPORT varchar(9),
DESTINATION_AIRPORT varchar(9));
-- TODO

select * from flights;
select * from airlines;
select * from airports;
select *, length(`ORIGIN_AIRPORT`), length(`DESTINATION_AIRPORT`) from flights;
select * from airports where length(`IATA_CODE`)=4;
