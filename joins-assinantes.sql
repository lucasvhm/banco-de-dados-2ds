-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)
CREATE TABLE Especialidade (cd_especialidade INT PRIMARY KEY, ds_especialidade VARCHAR(50));
CREATE TABLE Convenio (cd_convenio INT PRIMARY KEY, ds_convenio VARCHAR(50));
CREATE TABLE Medico (
    cd_medico INT PRIMARY KEY, 
    nm_medico VARCHAR(100), 
    cd_especialidade INT,
    FOREIGN KEY (cd_especialidade) REFERENCES Especialidade(cd_especialidade)
);
CREATE TABLE Paciente (
    cd_paciente INT PRIMARY KEY, 
    nm_paciente VARCHAR(100), 
    cd_convenio INT,
    FOREIGN KEY (cd_convenio) REFERENCES Convenio(cd_convenio)
);
CREATE TABLE Consulta (
    cd_consulta INT PRIMARY KEY, 
    dt_consulta DATE, 
    cd_medico INT, 
    cd_paciente INT,
    FOREIGN KEY (cd_medico) REFERENCES Medico(cd_medico),
    FOREIGN KEY (cd_paciente) REFERENCES Paciente(cd_paciente)
);

-- Inserções para teste
INSERT INTO Especialidade VALUES (1, 'Cardiologia'), (2, 'Pediatria');
INSERT INTO Convenio VALUES (1, 'SUS'), (2, 'Plano Alfa');
INSERT INTO Medico VALUES (1, 'Dr. Roberto', 1), (2, 'Dra. Juliana', 2);
INSERT INTO Paciente VALUES (1, 'Marcos Souza', 1), (2, 'Fernanda Lima', 2);
INSERT INTO Consulta VALUES (10, '2026-03-10', 1, 1), (20, '2026-03-11', 2, 2);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Especialidade;
SELECT * FROM Convenio;
SELECT * FROM Medico;
SELECT * FROM Paciente;
SELECT * FROM Consulta;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)
CREATE TABLE Categoria (cd_categoria INT PRIMARY KEY, ds_categoria VARCHAR(50));
CREATE TABLE Forma_Pagamento (cd_forma INT PRIMARY KEY, ds_forma VARCHAR(50));
CREATE TABLE Produto (
    cd_produto INT PRIMARY KEY, 
    nm_produto VARCHAR(100), 
    vl_produto DECIMAL(10,2),
    cd_categoria INT,
    FOREIGN KEY (cd_categoria) REFERENCES Categoria(cd_categoria)
);
CREATE TABLE Pedido (
    cd_pedido INT PRIMARY KEY, 
    dt_pedido DATE, 
    cd_forma INT,
    FOREIGN KEY (cd_forma) REFERENCES Forma_Pagamento(cd_forma)
);
CREATE TABLE Item_Pedido (
    cd_item INT PRIMARY KEY, 
    qt_item INT, 
    cd_pedido INT, 
    cd_produto INT,
    FOREIGN KEY (cd_pedido) REFERENCES Pedido(cd_pedido),
    FOREIGN KEY (cd_produto) REFERENCES Produto(cd_produto)
);

-- Inserções para teste
INSERT INTO Categoria VALUES (1, 'Eletrônicos'), (2, 'Livros');
INSERT INTO Forma_Pagamento VALUES (1, 'Cartão de Crédito'), (2, 'Pix');
INSERT INTO Produto VALUES (1, 'Smartphone V1', 1500.00, 1), (2, 'Banco de Dados SQL', 90.00, 2);
INSERT INTO Pedido VALUES (10, '2026-01-15', 2), (20, '2026-01-16', 1);
INSERT INTO Item_Pedido VALUES (101, 1, 10, 1), (102, 2, 20, 2);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Categoria;
SELECT * FROM Forma_Pagamento;
SELECT * FROM Produto;
SELECT * FROM Pedido;
SELECT * FROM Item_Pedido;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)
CREATE TABLE Curso (cd_curso INT PRIMARY KEY, ds_curso VARCHAR(50));
CREATE TABLE Periodo (cd_periodo INT PRIMARY KEY, ds_periodo VARCHAR(50));
CREATE TABLE Aluno (cd_aluno INT PRIMARY KEY, nm_aluno VARCHAR(100));
CREATE TABLE Turma (
    cd_turma INT PRIMARY KEY, 
    ds_turma VARCHAR(20), 
    cd_curso INT, 
    cd_periodo INT,
    FOREIGN KEY (cd_curso) REFERENCES Curso(cd_curso),
    FOREIGN KEY (cd_periodo) REFERENCES Periodo(cd_periodo)
);
CREATE TABLE Matricula (
    cd_matricula INT PRIMARY KEY, 
    cd_aluno INT, 
    cd_turma INT, 
    nt_final DECIMAL(4,2),
    FOREIGN KEY (cd_aluno) REFERENCES Aluno(cd_aluno),
    FOREIGN KEY (cd_turma) REFERENCES Turma(cd_turma)
);

-- Inserções para teste
INSERT INTO Curso VALUES (1, 'Análise de Sistemas'), (2, 'Administração');
INSERT INTO Periodo VALUES (1, 'Matutino'), (2, 'Noturno');
INSERT INTO Aluno VALUES (1, 'Lucas Oliveira'), (2, 'Mariana Reis');
INSERT INTO Turma VALUES (10, 'ADS-2026', 1, 2), (20, 'ADM-2026', 2, 1);
INSERT INTO Matricula VALUES (101, 1, 10, 8.5), (102, 2, 20, 9.0);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Curso;
SELECT * FROM Periodo;
SELECT * FROM Aluno;
SELECT * FROM Turma;
SELECT * FROM Matricula;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)
CREATE TABLE Tipo_Veiculo (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Status_Entrega (cd_status INT PRIMARY KEY, ds_status VARCHAR(50));
CREATE TABLE Motorista (cd_motorista INT PRIMARY KEY, nm_motorista VARCHAR(100));
CREATE TABLE Veiculo (
    cd_veiculo INT PRIMARY KEY, 
    tx_placa VARCHAR(10), 
    cd_tipo INT,
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Veiculo(cd_tipo)
);
CREATE TABLE Entrega (
    cd_entrega INT PRIMARY KEY, 
    ds_destino VARCHAR(100), 
    cd_motorista INT, 
    cd_veiculo INT, 
    cd_status INT,
    FOREIGN KEY (cd_motorista) REFERENCES Motorista(cd_motorista),
    FOREIGN KEY (cd_veiculo) REFERENCES Veiculo(cd_veiculo),
    FOREIGN KEY (cd_status) REFERENCES Status_Entrega(cd_status)
);

-- Inserções para teste
INSERT INTO Tipo_Veiculo VALUES (1, 'Caminhão Baú'), (2, 'Furgão');
INSERT INTO Status_Entrega VALUES (1, 'Em Trânsito'), (2, 'Entregue');
INSERT INTO Motorista VALUES (1, 'João da Silva'), (2, 'Pedro Santos');
INSERT INTO Veiculo VALUES (10, 'ABC-1234', 1), (20, 'XYZ-5678', 2);
INSERT INTO Entrega VALUES (101, 'Av. Central, 500', 1, 10, 1), (102, 'Rua das Flores, 12', 2, 20, 2);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Tipo_Veiculo;
SELECT * FROM Status_Entrega;
SELECT * FROM Motorista;
SELECT * FROM Veiculo;
SELECT * FROM Entrega;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)
CREATE TABLE Departamento (cd_depto INT PRIMARY KEY, ds_depto VARCHAR(50));
CREATE TABLE Cargo (cd_cargo INT PRIMARY KEY, ds_cargo VARCHAR(50));
CREATE TABLE Funcionario (
    cd_func INT PRIMARY KEY, 
    nm_func VARCHAR(100), 
    cd_depto INT, 
    cd_cargo INT,
    FOREIGN KEY (cd_depto) REFERENCES Departamento(cd_depto),
    FOREIGN KEY (cd_cargo) REFERENCES Cargo(cd_cargo)
);
CREATE TABLE Projeto (cd_projeto INT PRIMARY KEY, nm_projeto VARCHAR(100));
CREATE TABLE Alocacao (
    cd_alocacao INT PRIMARY KEY, 
    qt_horas INT, 
    cd_func INT, 
    cd_projeto INT,
    FOREIGN KEY (cd_func) REFERENCES Funcionario(cd_func),
    FOREIGN KEY (cd_projeto) REFERENCES Projeto(cd_projeto)
);

-- Inserções para teste
INSERT INTO Departamento VALUES (1, 'TI'), (2, 'Marketing');
INSERT INTO Cargo VALUES (1, 'Desenvolvedor'), (2, 'Analista');
INSERT INTO Funcionario VALUES (1, 'Ricardo Melo', 1, 1), (2, 'Camila Rocha', 2, 2);
INSERT INTO Projeto VALUES (10, 'Novo Web App'), (20, 'Campanha de Vendas');
INSERT INTO Alocacao VALUES (101, 40, 1, 10), (102, 20, 2, 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Departamento;
SELECT * FROM Cargo;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM Alocacao;
