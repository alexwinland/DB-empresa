CREATE TABLE `dept` (
  `DepNume` int(4) NOT NULL,
  `DepNome` char(20) NOT NULL,
  `DepLoca` char(20) NOT NULL,
  `DepOrca` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `dept` (`DepNume`, `DepNome`, `DepLoca`, `DepOrca`) VALUES
(10, 'PRESIDENCIA', 'SAO PAULO', 10000),
(20, 'INFORMATICA', 'RIO DE JANEIRO', 500000),
(30, 'VENDAS', 'BRASILIA', 20000),
(40, 'OPERACOES', 'BELO HORIZONTE', 300000),
(50, 'FABRICA', 'SAO PAULO', 300000);

CREATE TABLE `emp` (
  `EmpNume` int(5) NOT NULL,
  `EmpNome` char(30) NOT NULL,
  `EmpGere` int(5) DEFAULT NULL,
  `EmpServ` char(20) DEFAULT NULL,
  `DepNume` int(4) NOT NULL,
  `EmpAdmi` date NOT NULL,
  `EmpSala` int(10) DEFAULT NULL,
  `EmpComi` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `emp` (`EmpNume`, `EmpNome`, `EmpGere`, `EmpServ`, `DepNume`, `EmpAdmi`, `EmpSala`, `EmpComi`) VALUES
(1001, 'HORTENCIA OLIVA', 8003, 'BALCONISTA', 40, '1981-02-11', 500, NULL),
(1002, 'FERNANDA VENTURINNI', 8002, 'VENDEDOR', 30, '1983-04-01', 650, 50),
(1003, 'ANA MOSER', 8002, 'VENDEDOR', 30, '1982-05-06', 700, 55),
(1004, 'JANETH ARCAIN', 8003, 'BALCONISTA', 40, '1987-11-07', 800, NULL),
(1005, 'ANA PAULA', 8002, 'VENDEDOR', 30, '1987-01-01', 850, 70),
(1006, 'VIRNA DIAS', 8002, 'VENDEDOR', 30, '1988-12-10', 990, 70),
(1007, 'ROBERTO CARLOS', 8001, 'ANALISTA', 20, '1981-01-09', 1300, NULL),
(1008, 'CAETANO VELOSO', 8001, 'ANALISTA', 20, '1980-02-01', 1500, NULL),
(1009, 'ANA FLAVIA', 8002, 'VENDEDOR', 30, '1986-06-01', 900, 45),
(1010, 'MARIA PAULA', 8003, 'BALCONISTA', 40, '1980-01-01', 450, NULL),
(1011, 'GILBERTO GIL', 8001, 'ANALISTA', 20, '1983-03-04', 1800, NULL),
(1012, 'ERASMO CARLOS', 8001, 'ANALISTA', 20, '1978-04-03', 2100, NULL),
(1020, 'ZETTI', 8004, 'OPERARIO', 50, '1981-12-01', 450, NULL),
(1021, 'CAFU', 8004, 'OPERARIO', 50, '1978-12-02', 450, NULL),
(1022, 'RONALDINHO', 8004, 'OPERARIO', 50, '1981-01-01', 500, NULL),
(1023, 'GIOVANNI', 8004, 'OPERARIO', 50, '1980-01-01', 450, NULL),
(8001, 'GAL COSTA', 9000, 'GERENTE', 20, '1979-05-01', 2900, NULL),
(8002, 'MARIA BETHANIA', 9000, 'GERENTE', 30, '1980-06-07', 3400, NULL),
(8003, 'MARINA LIMA', 9000, 'GERENTE', 40, '1982-07-05', 4000, NULL),
(8004, 'DANIELA MERCURY', 9000, 'GERENTE', 50, '1985-08-08', 4500, NULL),
(9000, 'FERNANDO HENRIQUE', NULL, 'PRESIDENTE', 10, '1980-09-01', 7000, NULL);

ALTER TABLE `dept`
  ADD PRIMARY KEY (`DepNume`),
  ADD UNIQUE KEY `DepNum` (`DepNume`);

ALTER TABLE `emp`
  ADD PRIMARY KEY (`EmpNume`),
  ADD UNIQUE KEY `EmpNum` (`EmpNume`),
  ADD KEY `EmpDep` (`DepNume`);
COMMIT;