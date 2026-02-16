# 🎬 Projeto de Grafo de Conhecimento - Serviço de Streaming (Netflix Style)

Este projeto foi desenvolvido como parte de um estudo de **Banco de Dados Orientado a Grafos**. O objetivo é modelar um serviço de streaming onde as conexões entre usuários, filmes, atores e diretores permitem recomendações mais precisas.

## 🧠 O Modelo
Em vez de tabelas tradicionais, utilizamos uma estrutura de **Nós e Relacionamentos**:

- **Nós (Entidades):** `User`, `Movie`, `Genre`, `Actor`, `Director`.
- **Relacionamentos:**
  - `WATCHED`: Usuário assistiu ao filme (contém a propriedade `rating`).
  - `ACTED_IN`: Ator que atuou no filme.
  - `DIRECTED`: Diretor que dirigiu o filme.
  - `BELONGS_TO`: O gênero ao qual o filme pertence.



## 🛠️ Tecnologias Utilizadas
- **Banco de Dados:** Neo4j
- **Linguagem de Consulta:** Cypher

## 🚀 Como usar
1. Instale o **Neo4j Desktop** ou utilize o **Neo4j Sandbox**.
2. Execute os comandos do arquivo `script_netflix.cypher` para criar o banco de dados.
3. Para visualizar o grafo completo, use o comando: `MATCH (n) RETURN n`.