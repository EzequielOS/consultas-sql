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

select * from cursos;
