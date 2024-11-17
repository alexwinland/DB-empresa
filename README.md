# Sistema de Gestão de Departamentos e Funcionários

Este sistema foi desenvolvido para gerenciar departamentos e funcionários em uma organização. Ele utiliza duas tabelas principais: **Departamentos** e **Funcionários**, além de associar os funcionários aos departamentos de maneira eficaz.

## Estrutura do Banco de Dados

O banco de dados consiste em duas tabelas principais:

### 1. **Tabela `dept` (Departamentos)**

Armazena informações sobre os departamentos dentro de uma empresa. Cada departamento tem um identificador único e é caracterizado por seu nome, local e orçamento.

#### Campos:
- **DepNume**: Identificador único do departamento (chave primária).
- **DepNome**: Nome do departamento (ex: "PRESIDENCIA", "INFORMATICA").
- **DepLoca**: Local onde o departamento está situado (ex: "SAO PAULO").
- **DepOrca**: Orçamento do departamento (opcional).

### 2. **Tabela `emp` (Funcionários)**

Armazena as informações sobre os funcionários da empresa. Cada funcionário pode ser associado a um departamento específico.

#### Campos:
- **EmpNume**: Identificador único do funcionário (chave primária).
- **EmpNome**: Nome do funcionário (ex: "HORTENCIA OLIVA").
- **EmpGere**: Identificador do gerente do funcionário (relacionamento com outro funcionário).
- **EmpServ**: Cargo ou serviço do funcionário (ex: "VENDEDOR", "ANALISTA").
- **DepNume**: Identificador do departamento ao qual o funcionário está alocado (chave estrangeira referenciando a tabela `dept`).
- **EmpAdmi**: Data de admissão do funcionário.
- **EmpSala**: Número da sala onde o funcionário trabalha (opcional).
- **EmpComi**: Comissão do funcionário (opcional, pode ser null).

### Relacionamento entre as Tabelas

- Cada **funcionário** está alocado a um **departamento** por meio da chave estrangeira `DepNume` na tabela `emp`, que referencia a chave primária `DepNume` da tabela `dept`.
- A tabela `emp` também permite que um **gerente** seja associado a outros funcionários. Isso é feito por meio da coluna `EmpGere`, que faz referência a outro funcionário (gerente).

## Funcionalidades

### 1. **Cadastro de Departamentos**
A tabela `dept` permite que você registre todos os departamentos da empresa, com dados como nome, localização e orçamento. Isso permite que o sistema saiba quais departamentos existem e qual o orçamento disponível para cada um.

### 2. **Cadastro de Funcionários**
A tabela `emp` armazena as informações dos funcionários da empresa, incluindo o nome, cargo, o departamento em que trabalha, o gerente (se houver) e os dados administrativos (data de admissão, comissão, etc.).

### 3. **Gerenciamento de Relacionamento entre Funcionários e Departamentos**
Cada funcionário é alocado a um departamento, e o gerente de cada funcionário é indicado pela coluna `EmpGere`, criando uma estrutura hierárquica dentro da empresa.

### 4. **Consultas de Informações**
O sistema permite que você consulte facilmente as informações dos departamentos e funcionários, incluindo:
- Funcionários por departamento.
- Funcionários com comissão definida.
- Funcionários sob a gerência de um determinado chefe.

## Exemplo de Dados

### Inserindo Departamentos

```sql
INSERT INTO `dept` (`DepNume`, `DepNome`, `DepLoca`, `DepOrca`) VALUES
(10, 'PRESIDENCIA', 'SAO PAULO', 10000),
(20, 'INFORMATICA', 'RIO DE JANEIRO', 500000),
(30, 'VENDAS', 'BRASILIA', 20000),
(40, 'OPERACOES', 'BELO HORIZONTE', 300000),
(50, 'FABRICA', 'SAO PAULO', 300000);
```

### Inserindo Funcionários

```sql
INSERT INTO `emp` (`EmpNume`, `EmpNome`, `EmpGere`, `EmpServ`, `DepNume`, `EmpAdmi`, `EmpSala`, `EmpComi`) VALUES
(1001, 'HORTENCIA OLIVA', 8003, 'BALCONISTA', 40, '1981-02-11', 500, NULL),
(1002, 'FERNANDA VENTURINNI', 8002, 'VENDEDOR', 30, '1983-04-01', 650, 50),
(1003, 'ANA MOSER', 8002, 'VENDEDOR', 30, '1982-05-06', 700, 55),
(1004, 'JANETH ARCAIN', 8003, 'BALCONISTA', 40, '1987-11-07', 800, NULL),
(1005, 'ANA PAULA', 8002, 'VENDEDOR', 30, '1987-01-01', 850, 70),
(1006, 'VIRNA DIAS', 8002, 'VENDEDOR', 30, '1988-12-10', 990, 70);
```

### Definindo Chaves Primárias e Estrangeiras

```sql
ALTER TABLE `dept`
  ADD PRIMARY KEY (`DepNume`),
  ADD UNIQUE KEY `DepNum` (`DepNume`);

ALTER TABLE `emp`
  ADD PRIMARY KEY (`EmpNume`),
  ADD UNIQUE KEY `EmpNum` (`EmpNume`),
  ADD KEY `EmpDep` (`DepNume`);
```

## Consultas Comuns

### Consultar Todos os Departamentos

```sql
SELECT * FROM `dept`;
```

### Consultar Funcionários de um Departamento Específico

```sql
SELECT * FROM `emp` WHERE `DepNume` = 30; -- Exemplo para o departamento com `DepNume` = 30
```

### Consultar Todos os Funcionários Sob a Gerência de um Gerente Específico

```sql
SELECT * FROM `emp` WHERE `EmpGere` = 8002; -- Exemplo para o gerente com `EmpGere` = 8002
```

### Consultar Funcionários com Comissão Definida

```sql
SELECT * FROM `emp` WHERE `EmpComi` IS NOT NULL;
```

### Consultar Todos os Funcionários e seus Departamentos

```sql
SELECT e.EmpNome, d.DepNome
FROM emp e
JOIN dept d ON e.DepNume = d.DepNume;
```

## Conclusão

Este sistema fornece uma maneira eficiente de organizar e consultar informações sobre departamentos e funcionários dentro de uma empresa. Ele facilita o gerenciamento de recursos, alocação de pessoal em departamentos específicos e estrutura hierárquica de gerência. Além disso, a flexibilidade do sistema permite incluir dados adicionais, como comissões e salas, conforme necessário para os processos administrativos.
