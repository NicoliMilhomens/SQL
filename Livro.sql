CREATE TABLE Livro 
(liv_codigo  number(2),
constraint livro_liv_codigo_pk primary key (liv_codigo),
liv_titulo   varchar2(40),
liv_preco    number(3,2),
liv_lancamento date,
edi_codigo  number(2),
ass_sigla char(3)
);
CREATE TABLE Editora
(edi_codigo number(2),
constraint editora_edi_codigo_pk primary key (edi_codigo),
edi_nome   varchar2(30)
);
CREATE TABLE Autor 
(aut_matricula number(2),
constraint autor_aut_matricula_pk primary key (aut_matricula),
aut_nome varchar2(20),
aut_cpf   number(11),
aut_dtnasc  date,
aut_nacionalidade char(35)
);
CREATE TABLE Assunto
(ass_sigla char(3),
constraint assunto_ass_sigla_pk primary key (ass_sigla),
ass_descricao   varchar2(30)
);


CREATE TABLE Escreve 
(liv_codigo number(2),
constraint escreve_liv_codigo_fk foreign key (liv_codigo) references Livro(liv_codigo),
aut_matricula number(2),
constraint escreve_aut_matricula_fk foreign key (aut_matricula) references Autor(aut_matricula),
constraint escreve_pk primary key (liv_codigo,aut_matricula)
);

ALTER TABLE Livro
ADD(constraint Livro_ass_sigla_fk foreign key (ass_sigla) references Assunto(ass_sigla));

ALTER TABLE Livro
ADD(constraint Livro_edi_codigo_fk foreign key (edi_codigo) references Editora(edi_codigo));

ALTER TABLE Livro 
MODIFY(liv_preco number(5,2));


INSERT INTO Assunto VALUES('BAN','Banco de dados');
INSERT INTO Assunto VALUES('PRO','Programação');
INSERT INTO Assunto VALUES('RED','Redes');
INSERT INTO Assunto VALUES('SIS','Sistemas Operacionais');

INSERT INTO Editora VALUES(1,'Mirandela');
INSERT INTO Editora VALUES(2,'Editora Via Norte');
INSERT INTO Editora VALUES(3,'Editora Ilhas Tijucas');
INSERT INTO Editora VALUES(4,'Maria José');

INSERT INTO Autor VALUES(1,'Luiz',null,null,null);
INSERT INTO Autor VALUES(2,'Hugo',null,null,null);
INSERT INTO Autor VALUES(3,'Joaquim',null,null,null);
INSERT INTO Autor VALUES(4,'Regina',null,null,null);

INSERT INTO Livro VALUES(1,'Banco de dados para web','32,20','10/01/1999',1,'BAN');
INSERT INTO Livro VALUES(2,'Programando em linguagem c','30,00','01/10/1997',1,'PRO');
INSERT INTO Livro VALUES(3,'Programando em linguagem c++','115,50','01/11,1998',3,'PRO');
INSERT INTO Livro VALUES(4,'Banco de dados na bioinformática','48,00',null,2,'BAN');
INSERT INTO Livro VALUES(5,'Redes de computadores','42,00','01/09/1996',2,'RED');

INSERT INTO Escreve VALUES(1,1);
INSERT INTO Escreve VALUES(2,1);
INSERT INTO Escreve VALUES(3,2);
INSERT INTO Escreve VALUES(4,3);
INSERT INTO Escreve VALUES(5,4);

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro 
WHERE liv_preco>50 and (ass_sigla='ban');

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro
WHERE liv_preco>50 or (liv_titulo='P%');

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro
WHERE liv_lancamento is null;

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro
WHERE liv_titulo like'Banco%';

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro
WHERE liv_preco BETWEEN 10 AND 60;

SELECT liv_codigo,liv_titulo,liv_preco,liv_lancamento,edi_codigo,ass_sigla
FROM Livro
WHERE ass_sigla IN ('BAN','PRO');

SELECT Liv_Titulo,
REPLACE(Liv_Titulo,'Banco de Dados Distribuído'),
REPLACE(Liv_Titulo,'Banco de Dados para WEB')
FROM Livro;

SELECT Liv_Codigo, Liv_Preco 
REPLACE(Liv_Codigo >= '2'),
REPLACE(Liv_Preco >= '500')
FROM Livro;

SELECT *
REPLACE(Liv_Preco, '0')
WHERE (liv_Lancamento IS NULL or liv_Preco => '50,00')
FROM Livro;

SELECT * 
REPLACE(Ass_Sigla, 'BAN'),
REPLACE(Ass_Sigla, 'PRO')
FROM Livro

CREATE TABLE Livro_Backup
AS SELECT * FROM Livro;
