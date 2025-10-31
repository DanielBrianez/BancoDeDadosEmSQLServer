CREATE DATABASE SenacFitPlus;
USE SenacFitPlus;

CREATE TABLE Aluno(
id_aluno INT PRIMARY KEY IDENTITY (1,1),
nome VARCHAR(100) NOT NULL,
data_nascimento DATETIME NOT NULL,
cpf VARCHAR(14) UNIQUE NOT NULL,
telefone VARCHAR(50) NOT NULL,
endereco VARCHAR (MAX) NOT NULL
);

CREATE TABLE Instrutor(
id_instrutor INT PRIMARY KEY IDENTITY (1,1),
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) UNIQUE NOT NULL,
telefone VARCHAR(50) NOT NULL,
especialidade VARCHAR (MAX) NOT NULL
);

CREATE TABLE Turma(
id_turma INT PRIMARY KEY IDENTITY (1,1),
nome_turma VARCHAR (100) UNIQUE NOT NULL ,
capacidade INT NOT NULL,
horario VARCHAR(100) NOT NULL,
id_instrutor INT NOT NULL FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor)
);

CREATE TABLE Matricula(
id_aluno INT NOT NULL FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
id_turma INT NOT NULL FOREIGN KEY (id_turma) REFERENCES Turma (id_turma),
data_matricula DATETIME DEFAULT(GETDATE()) NOT NULL,
);

CREATE TABLE Pagamento(
id_pagamento INT PRIMARY KEY IDENTITY (1,1),
id_aluno INT NOT NULL FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
data_pagamento DATETIME DEFAULT(GETDATE()) NOT NULL,
valor DECIMAL (10,2) CHECK (valor > 0) NOT NULL,
status_pagamento VARCHAR(100) CHECK (status_pagamento IN('PAGO','ATRASADO','PENDENTE')) NOT NULL,
);