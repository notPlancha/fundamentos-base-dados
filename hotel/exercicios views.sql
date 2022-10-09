use aluno_105289_hoteldb;
-- 1
-- Lista de Reservas por pagar
create view ReservasNaoFacturadas as
    select r.Numero_Reserva as Reserva, r.Numero_Cliente as Cliente from reserva r
        left join factura f on r.Numero_Reserva = f.Numero_Reserva
    where f.Numero_Reserva is null;
select * from ReservasNaoFacturadas;
-- 2
-- Lista de Reservas por pagar com check out feito
create view ReservasNaoFacturadasPosCheckOut as
    select r.Numero_Reserva as Reserva, r.Numero_Cliente as Cliente
    from reserva r
        left join factura f on r.Numero_Reserva = f.Numero_Reserva
    where f.Numero_Reserva is null and CURRENT_DATE() > r.Dia_Saida;
select * from ReservasNaoFacturadasPosCheckOut;
-- 3
-- Nomes de Organizações que devem dinheiro
create view OrganizacoesQueDevem as
    select rnfpc.*, c.Nome_Cliente
    from ReservasNaoFacturadasPosCheckOut rnfpc
        left join organizacao o on rnfpc.Cliente = o.Numero_Cliente
        inner join cliente c on o.Numero_Cliente = c.Numero_Cliente;
select distinct oqd.Nome_Cliente from OrganizacoesQueDevem oqd;
-- 4
-- Listar as designações dos hotéis com maior número de quartos.
create view QuartosPorHotel (Hotel, Quartos) as
    Select Designacao, count(*) as c from Quarto, hotel Where hotel.Sigla_Hotel= Quarto.Sigla_Hotel Group by Designacao
    order by c;
select * from QuartosPorHotel;
-- 5
-- Listar os nomes dos clientes que têm reservas em todos os hotéis

create view ClientePorHotel as
 select Distinct Cliente.Numero_Cliente, Nome_Cliente, Hotel.Sigla_Hotel, Designacao
From Cliente, Reserva, Reserva_Quartos, Hotel
where cliente.Numero_Cliente= reserva.Numero_Cliente and reserva.Numero_Reserva =
reserva_quartos.Numero_Reserva AND reserva_quartos.Sigla_Hotel=hotel.Sigla_Hotel;

create view hotelCount(nHoteis) as -- preferi criar esta view caso hiuvesse condicoes adicionais (como uma coluna 'funcional'), neste caso n há
    select count(*) from hotel; -- a vantagem de ter esta view separada é que esta view pode ser mudada ao longo do tempo sem alterar a view principal

create view clienteEmTodos as
select cph.Numero_Cliente, cph.Nome_Cliente from ClientePorHotel cph
group by cph.Numero_Cliente
having count(*) = (select * from hotelCount);

select * from clienteEmTodos; -- Não da nenhum pq n há nenhum cliente em todos (há 7 hoteis mas a ONU só está em 6)
