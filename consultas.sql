/*
Nome do autor: Ezequiel de Oliveira Sant'Ana
Data de criação do arquivo: 04/01/2019
Objetivo sucinto do arquivo: Arquivo criado para testes e aprendizado de SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
Informações adicionais:
*/

create database Cadastro;
use Cadastro;

create table Pessoas(
	 nome varchar(30),
     idade tinyint(3),
     sexo char(1),
     peso float,
     altura float,
     nacionalidade varchar(20)
);

describe Pessoas;