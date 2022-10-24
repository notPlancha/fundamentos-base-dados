create table genres(
    id int primary key auto_increment,
    name varchar(200) unique
);
create table genresTitle(
    tconst varchar(10) references titlebasics(tconst),
    genreId int references genres(id),
    primary key (tconst, genreId)
);
create view view_lastGenres as
select distinct substring_index(t.genres, ',', -1) as name
from titlebasics t where trim(t.genres) != '';

create view view_firstGenres as
select distinct substring_index(t.genres, ',', 1) as name
from titlebasics t where trim(t.genres) != '';

create view view_secondGenres as
    select distinct substring_index(t.genres, ',',2) as name
from titlebasics t where trim(t.genres) != '';

create view view_MiddleGenres(name) as
    select substring_index(lg.name, ',',1) as name from view_secondGenres lg;

insert into genres(name)
    select fg.name from view_firstGenres fg where fg.name not in (select g.name from genres g );
insert into genres(name)
    select mg.name from view_middlegenres mg where mg.name not in (select g.name from genres g );
insert into genres(name)
    select lg.name from view_lastGenres lg where lg.name not in (select g.name from genres g );

create index ind_tconxtGT on genresTitle(tconst);
create index ind_genreIdGT on genresTitle(genreId);

insert into genresTitle(tconst, genreId)
SELECT t.tconst, g.id
from titlebasics t, genres g
where
    instr(t.genres, g.name) > 0;

drop index if EXISTS ind_PrimaryName on namebasics;
create index ind_PrimaryName on namebasics(primaryName);

select tp.tconst, count(distinct tp.ordering), count(distinct tp.nconst) from titleprincipals tp
group by tp.tconst having count(distinct tp.ordering) != count(distinct tp.nconst);

create index ind_nconst on titleprincipals(nconst);

create view view_titlesRobert(tconst, primaryTitle) as
select distinct tp.tconst, tb.originalTitle from titleprincipals tp
    left join titlebasics tb on tp.tconst = tb.tconst
    left join namebasics n on tp.nconst = n.nconst
where n.nconst = (select nb2.nconst from namebasics nb2 where primaryName = 'Robert De Niro');

create view view_genresRobert as
select gT.genreId from view_titlesRobert tR, genresTitle gT
where tR.tconst = gT.tconst;

select g.name, count(*) as times
from view_genresRobert gR
    join genres g on g.id = gR.genreId
group by genreId order by times DESC limit 1;

-- index dropppers
drop index ind_genreIdGT on genresTitle;
drop index ind_nconst on titleprincipals;
drop index if exists ind_PrimaryName on namebasics;
drop index if exists ind_tconxtGT on genresTitle;

-- view droppers
drop view if exists view_genresRobert;
drop view if exists view_titlesRobert;
drop view if exists view_lastGenres;
drop view if exists view_firstGenres;
drop view if exists view_middlegenres;
drop view if exists view_secondGenres;


-- table droppers
drop table genresTitle;
drop table genres;