/*
Nome do autor: Ezequiel de Oliveira Sant'Ana
Data de criação do arquivo: 04/01/2019
Objetivo sucinto do arquivo: Arquivo criado para testes e aprendizado de SQL
Referência: https://www.youtube.com/playlist?list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r
Informações adicionais:
*/

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'), 
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'), 
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'), 
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'), 
('5', 'Jarva', 'Introdução', '10', '29', '2000'), 
('6', 'MySql', 'Banco de Dados MySQL', '30', '15', '2016'), 
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'), 
('8', 'Sapateado', 'Danças Rítmicas', '40', '37', '2018'), 
('9', 'Cozinha Árabe', 'Aprender a fazer Kibe', '40', '30', '2018'), 
('10', 'Youtuber', 'Gerar polêmica e gahar inscritos', '5', '2', '2018');﻿


update Cursos /*aplica mudanças descritas abaixo*/
set nome = 'JAVA', carga = '40', ano = '2015'
where idcurso = '5';

	/* ------ Cuidado com isso ! --------
	set ano = '2050', carga = '0'
	where ano = '2018' //Todos com ano === 2018
	limit 1; //limita apenas ao primeiro*/

delete from Cursos /*deleta o especificado em 'where'*/
where idcurso = '8';

truncate Cursos; /*deleta a tabela*/


select * from cursos;