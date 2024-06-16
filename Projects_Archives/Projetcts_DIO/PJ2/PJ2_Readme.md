# Projeto de Personalização de Banco de dados

## 📖 Introdução
O  projeto é uma iniciativa da DIO para o treino na criação e modelagem de estruturas de dados reais. 
Vale lembrar que  podem haver erros na construção do modelo e que serão corrigidos, porém o propósito principal é o treino e a criação simulda de um banco de dados real.

## 🎯 Especificação Inicial da Entrega a ser realizada:


### 🛠️ Parte 1 – Personalizando acessos com views 

Neste desafio você irá criar visões para os seguintes cenários 

Número de empregados por departamento e localidade 

Lista de departamentos e seus gerentes 

Projetos com maior número de empregados (ex: por ordenação desc) 

Lista de projetos, departamentos e gerentes 

Quais empregados possuem dependentes e se são gerentes 

 
Além disso, serão definidas as permissões de acesso as views de acordo com o tipo de conta de usuários. 
Lembre-se que as views ficam armazaneadas no banco de dados como uma “tabela”. Assim podemos definir permissão de acesso a este item do banco de dados.  
 
Você poderá criar um usuário gerente que terá acesso as informações de employee e departamento. Contudo, employee não terá acesso as informações relacionadas aos departamentos ou gerentes. 

Um exemplo retirado da aula para criação de usuário e definição de permissão pode ser encontrado abaixo. 

CODE 1:

Obs: O tema de permissão de usuários foi apresentada no curso Explorando Cláusulas de DDL e Esquemas de Banco de Dados no MySQL. 

### 🛠️ Parte 2 – Criando gatilhos para cenário de e-commerce 

Objetivo:  
Objetivo: 

Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de e-commerce. 

 

Exemplo de trigger para base.

CODE 2:

Entregável: 

Triggers de remoção: before delete 

Triggers de atualização: before update 

 

Remoção:  

Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 

CODE 3:

Atualização:  

Inserção de novos colaboradores e atualização do salário base. 

CODE 4:

## Autor Arquivo  de Projeto 1
Autor: *Lucas Flor* (https://github.com/Lucas-Flor / https://www.linkedin.com/in/lucas-flor-de-lima/)
