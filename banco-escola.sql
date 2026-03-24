CREATE TABLE alunos (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    cpf TEXT UNIQUE
);

CREATE TABLE professores (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT
);

CREATE TABLE disciplinas (
    id_disciplina INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_disciplina TEXT NOT NULL,
    carga_horaria INTEGER,
    id_professor INTEGER,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);
