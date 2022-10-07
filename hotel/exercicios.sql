use aluno_105289_hoteldb;

-- 11
--
select
    hotel.Designacao, count(DISTINCT f.Numero_Factura) as c
from hotel
    left join reserva_quartos as rq on hotel.Sigla_Hotel = rq.Sigla_Hotel
    left join factura as f on rq.Numero_Reserva = f.Numero_Reserva
GROUP BY hotel.Designacao order by c DESC;
-- 15
-- Para cada nome de uma organização, indicar o total de reservas existentes nessa organização
select
    c.Nome_Cliente, count(r.Numero_Reserva) as Total_Reservas
from organizacao o
    left join cliente c on o.Numero_Cliente = c.Numero_Cliente
    left join reserva r on o.Numero_Cliente = r.Numero_Cliente
group by c.Numero_Cliente;
-- 16
-- Para cada designação de uma organização, indicar o total de reservas existentes por hotel
select
    subC.Nome_cliente, rq.sigla_hotel, count(rq.Numero_Reserva) as total
from reserva r
    right join
    (select c.Nome_Cliente, c.Numero_Cliente from cliente c right join organizacao o on c.Numero_Cliente = o.Numero_Cliente)
        subC on r.Numero_Cliente = subC.Numero_Cliente
    left join reserva_quartos rq on r.Numero_Reserva = rq.Numero_Reserva
group by subC.Nome_cliente, rq.sigla_hotel;