use aluno_105289_imdb;

--  1

select titletype, count(*) from titlebasics tb
where
    1980 <= startYear < 1990
    and tb.isAdult = 1
group by tb.titletype;

-- 2
-- indexes
create index ind_nconst on titleprincipals(nconst);

select count(distinct tconst) '# FilmesWoodyHimself' from namebasics nb
    right join titleprincipals t on nb.nconst = t.nconst
where
    nb.nconst = (select nb2.nconst from namebasics nb2 where nb2.primaryName = 'Woody Allen' limit 1)
    and lower(t.characters) like '%himself%';

-- droppers
drop index ind_nconst on titleprincipals;

-- 3
-- indexes
create index ind_nconst on titleprincipals(nconst);

-- select
select distinct primaryTitle from titleprincipals tp
    right join titlebasics tb on tb.tconst = tp.tconst
    left join namebasics nb on tp.nconst = nb.nconst
where
    nb.nconst = (select nb2.nconst from namebasics nb2 where nb2.primaryName = 'Woody Allen' limit 1)
    and lower(characters) like '%himself%'
    and titletype = 'movie';

-- dropers
drop index ind_nconst on titleprincipals;
