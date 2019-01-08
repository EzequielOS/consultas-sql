/*
Nome do autor: Ezequiel de Oliveira Sant'Ana
Data de criação do arquivo: 04/01/2019
Objetivo sucinto do arquivo: Arquivo criado para testes e aprendizado de SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
Informações adicionais:
*/

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


/*-------------------------- Tabela  Cursos -------------------------------------------*/

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

select * from cursos;
