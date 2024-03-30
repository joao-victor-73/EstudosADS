/*

Em bancos de dados, o tipo de dados ENUM (Enumerated Types) é usado para representar 
um conjunto de valores fixos que podem ser atribuídos a uma coluna. 
Esses valores são definidos pelo usuário durante a criação da tabela e são armazenados 
internamente como números inteiros, mas podem ser exibidos como strings.

Aqui está uma visão geral do uso do tipo ENUM:

    1. Definição de Valores Permitidos: Durante a criação da tabela, você especifica 
                                        os valores permitidos para a coluna ENUM.

    2. Armazenamento Interno: Internamente, o banco de dados atribui a cada valor do 
                              ENUM um número inteiro sequencial, começando de 1.

    3. Exibição de Valores: Ao consultar os dados, os valores armazenados como números 
                            inteiros são exibidos como strings de acordo com a definição
                            do ENUM.

    4. Restrição de Valores: O ENUM limita os valores que podem ser inseridos na coluna 
                                apenas aos valores definidos durante a criação da tabela.

*/

/* EXEMPLO DE COMO CRIAR UMA TABELA UTILIZANDO O `ENUM`*/
CREATE TABLE exemplo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado ENUM('Ativo', 'Inativo', 'Pendente')
);

/*
O uso do ENUM pode ser útil quando você tem um conjunto fixo de valores que uma coluna 
pode assumir e deseja impor essa restrição diretamente no nível do banco de dados. 

No entanto, deve-se ter cuidado ao usar o ENUM, pois adicionar ou remover valores após 
a criação da tabela pode ser um processo complicado e pode exigir a redefinição da 
estrutura da tabela. 

Além disso, o ENUM pode não ser tão flexível quanto usar tabelas de referência para 
armazenar esses valores, especialmente em cenários onde os valores podem mudar frequentemente.
*/