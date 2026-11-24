import sqlite3
import tkinter as tk
from tkinter import messagebox


# 2) Banco de Dados: Criação da conexão e da tabela
def conectar_banco():
  conexao = sqlite3.connect("clientes.db")
  cursor = conexao.cursor()
  cursor.execute("""
        CREATE TABLE IF NOT EXISTS clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            telefone TEXT NOT NULL
        )
    """)
  conexao.commit()
  conexao.close()


# 3) Funcionalidades: Limpar formulário
def limpar_formulario():
  entry_nome.delete(0, tk.END)
  entry_email.delete(0, tk.END)
  entry_telefone.delete(0, tk.END)
  entry_nome.focus()


# 3) Funcionalidades e 4) Validação: Salvar cliente
def salvar_cliente():
  nome = entry_nome.get().strip()
  email = entry_email.get().strip()
  telefone = entry_telefone.get().strip()

  # Validação: verifica se todos os campos foram preenchidos
  if not nome or not email or not telefone:
    messagebox.showwarning("Atenção", "Por favor, preencha todos os campos!")
    return

  try:
    conexao = sqlite3.connect("clientes.db")
    cursor = conexao.cursor()
    cursor.execute(
        "INSERT INTO clientes (nome, email, telefone) VALUES (?, ?, ?)",
        (nome, email, telefone),
    )
    conexao.commit()
    conexao.close()

    messagebox.showinfo("Sucesso", "Cliente cadastrado com sucesso!")
    limpar_formulario()
  except sqlite3.Error as erro:
    messagebox.showerror("Erro", f"Erro ao salvar no banco de dados: {erro}")


# Inicializa o banco de dados ao abrir o programa
conectar_banco()

# 1) Interface Gráfica: Configuração da janela principal
janela = tk.Tk()
janela.title("Cadastro de Clientes")
janela.geometry("350x220")
janela.resizable(False, False)

# Rótulos e Campos de Entrada
tk.Label(janela, text="Nome:").grid(
    row=0, column=0, padx=10, pady=10, sticky="w"
)
entry_nome = tk.Entry(janela, width=35)
entry_nome.grid(row=0, column=1, padx=10, pady=10)

tk.Label(janela, text="E-mail:").grid(
    row=1, column=0, padx=10, pady=10, sticky="w"
)
entry_email = tk.Entry(janela, width=35)
entry_email.grid(row=1, column=1, padx=10, pady=10)

tk.Label(janela, text="Telefone:").grid(
    row=2, column=0, padx=10, pady=10, sticky="w"
)
entry_telefone = tk.Entry(janela, width=35)
entry_telefone.grid(row=2, column=1, padx=10, pady=10)

# Frame para organizar os botões lado a lado
frame_botoes = tk.Frame(janela)
frame_botoes.grid(row=3, column=0, columnspan=2, pady=15)

btn_salvar = tk.Button(
    frame_botoes,
    text="Salvar",
    width=12,
    command=salvar_cliente,
    bg="#4CAF50",
    fg="white",
)
btn_salvar.pack(side=tk.LEFT, padx=10)

btn_limpar = tk.Button(
    frame_botoes, text="Limpar", width=12, command=limpar_formulario
)
btn_limpar.pack(side=tk.LEFT, padx=10)

# Inicia o loop da interface gráfica
janela.mainloop()
