/*
Código SQL para criação do banco de dados e tabelas
*/
CREATE SCHEMA imoveis;

USE imoveis;


CREATE TABLE imovel (
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150),
    tipoImovel VARCHAR(50)
);


CREATE TABLE venda (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    id_imovel INT NOT NULL,
    dataPagamento DATE,
    valorPagamento DECIMAL,
    CONSTRAINT fk_venda_imovel FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

INSERT INTO imovel (descricao, tipoImovel) VALUE
	('Apartamento de 2 quartos em prédio residencial.','Apartamento'),
    ('Apartamento de luxo com vista para o mar.','Apartamento'),
    ('Casa de campo com piscina e área de churrasco.','Casa'),
    ('Casa térrea com jardim nos arredores da cidade.','Casa'),
    ('Sobrado geminado em bairro residencial','Sobrado'),
    ('Sobrado com terraço e garagem para dois carros.','Sobrado'),
    ('Cobertura duplex com área de lazer privativa.','Cobertura'),
    ('Cobertura com piscina e vista panorâmica da cidade.','Cobertura')
    ;

INSERT INTO venda (id_imovel, dataPagamento, valorPagamento) VALUE
	('1','2023/02/17','1700'), ('1','2023/03/16','1700'),
	('1','2023/04/17','1700'),('1','2023/05/15','1700'),('1','2023/06/14','1700'),
    
    ('2','2022/12/05','9500'), ('2','2023/01/07','9500'),
    ('2','2023/02/06','9500'), ('2','2023/03/05','9500'), ('2','2023/04/05','9500'),
    
    ('3','2023/04/10','3200'), ('3','2023/05/09','3200'),
	('3','2023/06/11','3200'),('3','2023/07/11','3200'),('3','2023/08/08','3200'),
    
    ('4','2022/11/15','2400'), ('4','2022/12/09','2400'),
	('4','2023/01/14','2400'),('4','2023/02/11','2400'),('4','2023/03/16','2400'),
    
    ('5','2023/03/09','2100'), ('5','2023/04/08','2100'),
	('5','2023/05/10','2100'),('5','2023/06/12','2100'),('5','2023/07/13','2100'),
    
    ('6','2023/04/11','3900'), ('6','2023/05/10','3900'),
	('6','2023/06/13','3900'),('6','2023/07/12','3900'),('6','2023/08/09','3900'),
    
    ('7','2023/03/06','15700'), ('7','2023/04/07','15700'),
	('7','2023/05/06','15700'),('7','2023/06/06','15700'),('7','2023/07/07','15700'),
    
    ('8','2023/02/08','15200'), ('8','2023/03/09','15200'),
	('8','2023/04/08','15200'),('8','2023/05/08','15200'),('8','2023/06/08','15200')
    ;

SELECT v.*, i.descricao, i.tipoImovel 
FROM venda v
INNER JOIN imovel i ON v.id_imovel = i.id;
    
SELECT * FROM imovel;
SELECT * FROM venda;

SELECT i.id, SUM(v.valorPagamento) AS totalVenda
FROM imovel i
INNER JOIN venda v ON i.id = v.id_imovel
GROUP BY i.id;

SELECT DATE_FORMAT(dataPagamento, '%Y-%m') AS mesAno, SUM(valorPagamento) AS totalVendas
FROM venda
GROUP BY mesAno;

SELECT 
    i.tipoImovel, 
    COUNT(v.id) AS totalVendas,
    (COUNT(v.id) / (SELECT COUNT(*) FROM venda)) * 100 AS percentualVendas
FROM 
    imovel i
INNER JOIN 
    venda v ON i.id = v.id_imovel
GROUP BY 
    i.tipoImovel;
