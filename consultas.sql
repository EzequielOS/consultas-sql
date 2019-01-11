/*
Nome do autor: Ezequiel de Oliveira Sant'Ana
Data de criação do arquivo: 04/01/2019
Objetivo sucinto do arquivo: Arquivo criado para testes e aprendizado de SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
Informações adicionais:
*/



create database Cadastro
default character set utf8
default collate utf8_general_ci;
use Cadastro;
/*drop database Cadastro;  //deleta um DB*/

create table Pessoas(
	id int not null auto_increment,
	nome varchar(30) not null,
    nascimento date,
    sexo enum('M','F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) default "Brasil",
    primary key (id)
)default charset = utf8;

insert into Pessoas values
(default, 'Claudio', '1945-4-22', 'M', '99.0', '2.15', 'Brasil'),
(default, 'Pedro', '1999-12-3', 'M', '87', '2', default),
(default, 'Janaina', '1987-11-12', 'F', '75.4', '1.66', 'EUA');


desc Pessoas;

alter table Pessoas
rename to gafanhotos;/*renomea a tabela*/

alter table Pessoas
add column profissao varchar(10) after nome;/*adiciona na proxima posicao*/
/*add codigo int first; //adiciona coluna na 1a posição*/
/*add column profissao varchar(10); //adiciona na ultima posicao*/

alter table Pessoas
/*drop column profissao; //exclui coluna no alter table*/
modify column profissao varchar(20) not null default '';

alter table Pessoas
change profissao prof varchar(20);/*renomea coluna*/

select * from Pessoas;

create table if not exists cursos(
nome varchar (30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2016'
) default charset=utf8;

alter table cursos
add idcurso int first;

alter table cursos
add primary key (idcurso);

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução', '10', '29', '2000'),
('6', 'MySql', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016');

update Cursos /*aplica mudanças descritas abaixo*/
set nome = 'JAVA', carga = '40', ano = '2015'
where idcurso = '5';

delete from Cursos /*deleta o especificado em 'where'*/
where idcurso = '8';

truncate Cursos; /*deleta a tabela*/

/*--------------- COMANDOS SELECT ---------*/

select * from cursos /*exibe tudo com valores descrito abaixo*/
where ano <= '2016'
order by ano, nome;

select nome, carga, totaulas from cursos
where carga > '35' and totaulas < '30'
order by totaulas desc;


select * from cursos
where nome like 'a%'; /*exibe o que começa com a*/

select distinct nacionalidade from gafanhotos; /*exibe resultados sem repeti-los*/

select count(*) from cursos /*conta total de linhas com especificacoes descritas*/
where ano = '2016';

select max(carga) from cursos /*seleciona a campos maior na linha*/
where ano = '2018';

select nome, min(totaulas) from cursos;/*seleciona a campos menor na linha*/

select sum(totaulas) from cursos /*soma campos das linhas*/
where ano = '2014';

select * from cursos
where ano = '2014';

select avg(carga) from cursos;/*calcula media dos campos das linhas*/


/*---- EXERCICIOS do VIDEO ----*/
select nome from gafanhotos
where sexo = 'F';

select * from gafanhotos
where nascimento >= '2000-01-01' and nascimento <= '2015-12-31';

select nome from gafanhotos
where sexo = 'M' and profissao = 'Programador';

select * from gafanhotos
where nacionalidade = 'brasil' and  sexo = 'F' and nome like 'j%';

select nome, nacionalidade from gafanhotos
where  nacionalidade != 'Brasil' and peso < '100' and nome like '%Silva';

select max(altura) from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'M';

select avg(altura) from gafanhotos
where sexo = 'M';

select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade != 'Brasil' and nascimento >= '1990-01-01' and nascimento <= '2000-12-31';

select count(id) from gafanhotos
where sexo = 'F' and altura > '1.90';

/* -------------------------- ------------------- ----------------*/

select totaulas, count(totaulas) from cursos
group by totaulas /*Agrupa todos os cursos de mesma quantidade de aula*/
order by totaulas;

select totaulas, count(totaulas) from cursos
group by totaulas
having totaulas > (select avg(totaulas) from cursos) /*exibe apenas aulas com numero maoir que a media de aulas*/
order by totaulas;

/*---- EXERCICIOS do VIDEO ----*/
select profissao, count(profissao) from gafanhotos
group by profissao 
order by profissao;

select sexo, count(id) from gafanhotos
where nascimento > '2005-01-01'
group by sexo
order by sexo;

select nacionalidade, count(nacionalidade) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade) >'3'
order by nacionalidade;

select avg(altura) from gafanhotos;

select altura, count(altura) from gafanhotos
where peso > '100.0'
group by altura
having altura > (select avg(altura) from gafanhotos)
order by altura;

/* -------------------------- ------------------- ----------------*/


/* ------------Exercicios site SQL Teaching ----------------*/
select name, species from family_members;

select * from family_members
where species = 'dog';

select * from family_members
where num_books_read  > 190;

select * from family_members
where num_books_read  >= 180;

select * from friends_of_pickles
where species = 'dog' and height_cm < '45';

select * from friends_of_pickles
where species not in('cat','dog');

select distinct species from friends_of_pickles
where height_cm > 50;

select * from friends_of_pickles
order by height_cm desc;

select * from friends_of_pickles
order by height_cm desc
limit 1;

select count(*) from friends_of_pickles;

select count(*) from friends_of_pickles
where species = 'dog';

select sum(num_books_read) from family_members;

select avg(num_books_read) from family_members;

select max(num_books_read) from family_members;

select max(height_cm), species from friends_of_pickles
group by species;

select * from family_members 
where num_books_read= (select max(num_books_read) FROM family_members); 

select * from family_members 
where favorite_book != 'null';

select * from celebs_born
where birthdate > '1980-09-01';

/* -------------------------- ------------------- ----------------*/