use aluno_105289_hoteldb;

-- 1
-- Listar o nome de todos os clientes por ordem alfabética decrescente
select Nome_Cliente from cliente order by Nome_Cliente DESC ;

-- 2
-- Listar o número dos quartos do hotel cuja sigla é RM
select q.Numero_Quarto from hotel h
    join quarto q on h.Sigla_Hotel = q.Sigla_Hotel
where h.Sigla_Hotel = 'RM';

-- 3
-- Quantos hotéis existem na nossa base de dados?
select count(*) as '# Hoteis' from hotel;

-- 4
-- Quantos quartos têmo hotel Majestic (sigla MJ)? E quantas camas têm? (apenas um comando)
select count(Numero_Quarto) as '# Quartos', sum(Numero_Camas) as '# Camas' from hotel h
    join quarto q on h.Sigla_Hotel = q.Sigla_Hotel
where h.Sigla_Hotel = 'MJ';

-- 5
-- Listar o nome de todos os clientes individuais
select Nome_Cliente from individual i
    left join cliente c on c.Numero_Cliente = i.Numero_Cliente;

-- 6
-- Listar o nome de todos os clientes organizações que trabalham no ramo Alimentar
select Nome_Cliente from organizacao o
    left join cliente c on c.Numero_Cliente = o.Numero_Cliente
where Ramo_Actividade = 'Alimentar';

-- 7
-- Quais os nomes dos clientes individuais que não têm BI
select Nome_Cliente from individual i
    left join cliente c on c.Numero_Cliente = i.Numero_Cliente
where i.BI is null;

-- 8
-- Quais as designações dos hotéis que têm reservas em que pelo menos um quarto está afecto a mais do que duas pessoas?
select h.Designacao from reserva_quartos rq
    left JOIN hotel h on h.Sigla_Hotel = rq.Sigla_Hotel
where Numero_Pessoas > 2;

-- 9
-- Quais a designação dos hotéis que têm reservas para o mês de Setembro e/ou Agosto de 2012? (basta que um dos dias da
-- reserva calhe entre 1 Agosto e 30 de setembro para que sejam seleccionados)
select distinct h.Designacao from reserva r
    left join reserva_quartos rq on r.Numero_Reserva = rq.Numero_Reserva
    left join hotel h on rq.Sigla_Hotel = h.Sigla_Hotel
where
    (r.Dia_Entrada between '2012-8-1' and '2012-10-1')
 or (r.Dia_Saida between '2012-8-1' and '2012-10-1');

-- 10
-- Quais os números de reserva efectuados pela ONU e pela Ana?
select r.Numero_Reserva
from reserva r
    left join cliente c on r.Numero_Cliente = c.Numero_Cliente
where Nome_Cliente in ('ONU', 'Ana');

-- 11
-- Liste os nomes dos hotéis onde o cliente ISCTE já efectuou reservas
select
    hotel.Designacao, count(DISTINCT f.Numero_Factura) as c
from hotel
    left join reserva_quartos as rq on hotel.Sigla_Hotel = rq.Sigla_Hotel
    left join factura as f on rq.Numero_Reserva = f.Numero_Reserva
GROUP BY hotel.Designacao order by c DESC;

-- 12
-- Listar, para cada designação do hotel, a quantidade de facturas
select h.Designacao, count(distinct f.Numero_Factura)
from factura f
    left join reserva_quartos rq on f.Numero_Reserva = rq.Numero_Reserva
    right join hotel h on rq.Sigla_Hotel = h.Sigla_Hotel
group by h.Sigla_Hotel;
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