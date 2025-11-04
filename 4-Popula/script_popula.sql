INSERT INTO PROPRIETARIO (cpf, nome, dataNascimento, telefone, sexo, rua, numero, cep, bairro, cidade, estado) VALUES
('11122233344', 'Joao Silva', '1980-05-10', '11987654321', 'M', 'Rua A', '10', '12345678', 'Centro', 'Sao Paulo', 'SP'),
('22233344455', 'Maria Oliveira', '1992-11-20', '21987654322', 'F', 'Av B', '200', '23456789', 'Tijuca', 'Rio de Janeiro', 'RJ'),
('33344455566', 'Carlos Pereira', '1975-01-30', '31987654333', 'M', 'Rua C', '30', '34567890', 'Lourdes', 'Belo Horizonte', 'MG'),
('44455566677', 'Ana Costa', '2000-07-15', '41987654444', 'F', 'Rua D', '400', '45678901', 'Batel', 'Curitiba', 'PR'),
('55566677788', 'Pedro Martins', '1988-03-25', '51987654555', 'M', 'Av E', '50', '56789012', 'Moinhos', 'Porto Alegre', 'RS');

INSERT INTO MODELO (numeroModelo, nomeModelo) VALUES
(000001, 'Gol 1.8'),
(000002, 'Onix 1.0'),
(000003, 'Mobi 1.0'),
(000004, 'Corolla 1.5'),
(000005, 'Hilux 2.8'),
(000006, 'XRE 300');

INSERT INTO CATEGORIA (numeroCategoria, nomeCategoria) VALUES
(01, 'AUTOMÓVEL'),
(02, 'CAMINHÃO'),
(03, 'MOTOCICLETA'),
(04, 'CAMINHONETE'),
(05, 'ÔNIBUS');

INSERT INTO AGENTE (matricula, nome, dataContratacao) VALUES
(1001, 'Agente Silva', '2010-01-15'),
(1002, 'Agente Souza', '2012-06-01'),
(1003, 'Agente Lima', '2018-11-30'),
(1004, 'Agente Ferreira', '2020-02-20'),
(1005, 'Agente Alves', '2021-09-10');

INSERT INTO TIPOINFRACAO (numeroInfracao, valor, descricaoInfracao) VALUES
(74550, 195.23, 'Velocidade superior a maxima em ate 20%'),
(74630, 293.47, 'Velocidade superior a maxima em mais de 20% ate 50%'),
(74710, 880.41, 'Velocidade superior a maxima em mais de 50%'),
(51851, 293.47, 'Estacionar em vaga de deficiente'),
(60503, 293.47, 'Avancar o sinal vermelho');

INSERT INTO LOCAL (latitudeLongitude, velocidadePermitida) VALUES
('-23.5505,-46.6333', 50), 
('-22.9068,-43.1729', 60), 
('-19.9167,-43.9345', 60), 
('-25.4284,-49.2733', 40), 
('-30.0346,-51.2177', 60); 

INSERT INTO VEICULO (placa, chassi, cor, anoFabricacao, FK_PROPRIETARIO_cpf) VALUES
('ABC1234', '123456789ABCDEFGH', 'Preto', '2020-01-01', '11122233344'), --veiculo 1 do joao
('DEF5678', '234567890BCDEFGHI', 'Branco', '2022-03-15', '22233344455'),
('GHI9012', '345678901CDEFGHIJ', 'Prata', '2018-06-20', '33344455566'),
('JKL3456', '456789012DEFGHIJK', 'Vermelho', '2021-07-10', '44455566677'),
('MNO7890', '567890123EFGHIJKL', 'Azul', '2019-11-05', '11122233344'), --veiculo 2 do joao
('PQR1357', '678901234FGHIJKLM', 'Preto', '2023-01-30', '55566677788');

INSERT INTO tem_VEICULO_MODELO_CATEGORIA (fk_VEICULO_placa, fk_MODELO_numeroModelo, fk_CATEGORIA_numeroCategoria) VALUES
('ABC1234', 000001, 01), -- gol, automovel
('DEF5678', 000002, 01), -- onix, automovel
('GHI9012', 000003, 01), -- mobi, automovel
('JKL3456', 000004, 01), -- corolla, automovel
('MNO7890', 000005, 04), -- hilux, caminhonete
('PQR1357', 000006, 03); -- xre 300, motocicleta

INSERT INTO INFRACAO (idInfracao, dataHora, velocidadeAferida, FK_VEICULO_placa, FK_AGENTE_matricula, FK_TIPOINFRACAO_numeroInfracao, FK_LOCAL_latitudeLongitude) VALUES
(1, '2023-10-01 08:15:00', 60, 'ABC1234', 1001, 74550, '-23.5505,-46.6333'), -- excesso 20% (permitido 50km/h, aferida 60km/h)
(2, '2023-10-05 14:30:00', 95, 'GHI9012', 1002, 74630, '-22.9068,-43.1729'), -- excesso 20-50% (permitido 60km/h, aferida 95km/h)
(3, '2023-10-10 17:45:00', 0, 'DEF5678', 1003, 60503, '-19.9167,-43.9345'), -- sinal vermelho
(4, '2023-10-12 10:00:00', 0, 'JKL3456', 1001, 51851, '-25.4284,-49.2733'), -- vaga deficiente
(5, '2023-10-15 22:00:00', 120, 'MNO7890', 1004, 74710, '-30.0346,-51.2177'), -- excesso 50%+ (permitido 60km/h, aferida 120km/h)
(6, '2023-10-16 09:00:00', 58, 'ABC1234', 1001, 74550, '-23.5505,-46.6333'); -- excesso 20% (permitido 50km/h, aferida 58km/h)