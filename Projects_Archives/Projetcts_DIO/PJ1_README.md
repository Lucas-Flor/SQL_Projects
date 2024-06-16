# Projeto de Personalização de Banco de dados

## 📖 Introdução
O  projeto é uma iniciativa da DIO para o treino na criação e modelagem de estruturas de dados reais. 
Vale lembrar que  podem haver erros na construção do modelo e que serão corrigidos, porém o propósito principal é o treino e a criação simulda de um banco de dados real.

## 🎯 Especificação Inicial da Entrega a ser realizada:


### 🛠️ Parte 1 – Criando índices em Banco de Dados 

Criação de índices para consultas para o cenário de company com as perguntas (queries sql) para recuperação de informações. Sendo assim, dentro do script será criado os índices com base na consulta SQL.  

O que será levado em consideração para criação dos índices? 

Quais os dados mais acessados 

Quais os dados mais relevantes no contexto 

Lembre-se da função do índice... ele impacta diretamente na velocidade da buca pelas informações no SGBD. Crie apenas aqueles que são importantes. Sendo assim, adicione um README dentro do repositório do Github explicando os motivos que o levaram a criar tais índices. Para que outras pessoas possam se espelhar em seu trabalho, crie uma breve descrição do projeto. 
 

A criação do índice pode ser criada via ALTER TABLE ou CREATE Statement, como segue o exemplo: 

ALTER TABLE customer ADD UNIQUE index_email(email); 

CREATE INDEX index_ativo_hash ON exemplo(ativo) USING HASH; 

 
Perguntas:  

Qual o departamento com maior número de pessoas? 

Quais são os departamentos por cidade? 

Relação de empregrados por departamento 

 
Entregável: 

Crie as queries para responder essas perguntas 

Crie o índice para cada tabela envolvida (de acordo com a necessidade) 

Tipo de indice utilizado e motivo da escolha (via comentário no script ou readme) 

### 🛠️ Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados 

Objetivo:  

Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).  

Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

 
Sendo assim, altere a procedure abaixo para receber as informações supracitadas. 

Entregável: 

Script SQL com a procedure criada e chamada para manipular os dados de universidade e e-commerce. Podem ser criados dois arquivos distintos, assim como a utilização do mesmo script para criação das procedures. Fique atento para selecionar o banco de dados antes da criação da procedure. 

## Autor Arquivo  de Projeto 1
Autor: *Lucas Flor* (https://github.com/Lucas-Flor / https://www.linkedin.com/in/lucas-flor-de-lima/)
