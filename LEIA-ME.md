# PotroCão: Pacote 3 (identidade visual + Serviços + Controle de Estoque)

## Como abrir
1. Feche o Visual Studio.
2. Extraia este ZIP em `C:\Projetos` (fora do OneDrive).
3. Abra o `PotroCao.slnx`.
4. Vá em **Compilação → Recompilar Solução**. Na primeira vez, o Visual Studio baixa sozinho o ClosedXML e o MySql.Data.
5. Inicie o MySQL no XAMPP e aperte **F5**.

## Telas com o visual novo (17 de 17)
| Tela | Status |
|---|---|
| Form1 (painel principal) | ✔ refeito: menu lateral, indicadores, atalhos, próximos agendamentos |
| FrmCadastrarCliente / FrmConsultarCliente | ✔ |
| FrmCadastrarPet / FrmConsultarPet | ✔ |
| FrmCadastrarAgendamento / FrmConsultarAgendamento | ✔ |
| FrmCadastrarFuncionario / FrmConsultarFuncionario | ✔ |
| FrmCadastrarCategoria / FrmConsultarCategoria | ✔ |
| FrmCadastrarProduto / FrmConsultarProduto | ✔ |
| FrmCadastrarServico / FrmConsultarServico | ✔ (módulo novo) |
| FrmEstoque (Controle de Estoque) | ✔ (módulo novo) |
| Caixas de mensagem (todas as telas) | ✔ (CaixaMensagem) |

As edições usam as mesmas telas de cadastro, que trocam o título para "Editar ...".

## Arquivos novos
- `Tema.cs`: paleta oficial, fontes, botões arredondados, tabelas, cartões e cabeçalhos
- `CaixaMensagem.cs`: caixa de mensagem no visual do PotroCão
- `Formularios/FrmCadastrarServico.cs` + `.Designer.cs`
- `Formularios/FrmConsultarServico.cs` + `.Designer.cs`
- `Recursos/logo.png`, `Recursos/emblema.png`, `Recursos/potrocao.ico`: logo original com fundo transparente, emblema e ícone do app

## Arquivos modificados
- Todos os `.Designer.cs`: novo layout. Os nomes dos controles e dos eventos foram mantidos.
- Todos os formulários `.cs`: linha `Tema.Aplicar(this);` e `MessageBox.Show` trocado por `CaixaMensagem.Show`.
- `Form1.cs`: painel com dados reais do banco.
- `FrmConsultarCliente.cs`, `FrmConsultarPet.cs`, `FrmConsultarAgendamento.cs`, `FrmConsultarFuncionario.cs`: botão "Novo" (e "Voltar" na consulta de pets).
- `Program.cs`: nitidez em telas com escala (125%/150%).
- `Utilitarios.cs`, `PotroCao.csproj`.

## Problemas corrigidos
- Botões **Limpar** e **Voltar** do cadastro de funcionários não tinham evento ligado.
- O botão **Serviços** do menu não abria nada (o módulo não existia).
- A consulta de pets não tinha botão Voltar, e o botão "Excluir" na verdade inativava. Agora se chama "Inativar".
- A mensagem "Conexão realizada com sucesso" aparecia toda vez que o sistema abria. Agora o status aparece no painel, e só avisa se houver erro.

## Nenhuma biblioteca nova
Só Windows Forms, MySql.Data e ClosedXML, que já estavam no projeto. Os ícones usam a fonte **Segoe MDL2 Assets**, que já vem no Windows 10 e 11.

## Banco de dados
Nenhuma tabela existente foi alterada. Só existe uma tabela nova, `movimentacao_estoque`, que é criada pelo script.

## Controle de Estoque (Etapa 5)
- Tela nova `FrmEstoque`. Abre pelo menu **Estoque → Controle de Estoque** ou pelo botão **Estoque** na tela de Produtos.
- Registra entradas e saídas com motivo e responsável (opcional), não deixa o estoque ficar negativo, avisa quando o estoque está baixo e tem filtro "Só Estoque Baixo".
- Cada lançamento é gravado numa transação: a quantidade do produto e o histórico mudam juntos, ou nenhum dos dois muda.
- Produto novo com estoque inicial gera automaticamente a primeira entrada no histórico.
- **Antes de usar, rode o script `criar_movimentacao_estoque.sql` no phpMyAdmin.** Ele cria a tabela `movimentacao_estoque` e não altera nenhuma tabela existente.

## Ainda falta (próximo pacote)
- Etapa 7: **vínculo de serviços ao agendamento** (`agendamento_servico`), com cálculo do valor total.
