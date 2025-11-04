/* SCRIPT CONSULTA - Banco de dados Detran

Autor: Arthur Choi Braga
Data: 04/11/2025

Descrição: Script para consultar as tabelas do banco de dados do Detran.
*/

-- A) Apresentar todos os dados dos veículos de um determinado proprietário (informado pelo usuário através do CPF);
SELECT
    P.nome AS nome_proprietario,
    V.placa,
    V.chassi,
    V.cor,
    V.anoFabricacao,
    M.nomeModelo AS nome_do_modelo,
    C.nomeCategoria AS nome_da_categoria

FROM VEICULO AS V

JOIN PROPRIETARIO AS P ON V.FK_PROPRIETARIO_cpf = P.cpf -- conecta onde o CPF do veículo (em V) é igual ao CPF (em P)

JOIN tem_VEICULO_MODELO_CATEGORIA AS T ON V.placa = T.fk_VEICULO_placa -- conecta onde a placa (em V) é igual à placa (em T)

JOIN MODELO AS M ON T.fk_MODELO_numeroModelo = M.numeroModelo -- conecta onde o número do modelo (em T) é igual (em M)

JOIN CATEGORIA AS C ON T.fk_CATEGORIA_numeroCategoria = C.numeroCategoria -- conecta onde o número da categoria (em T) é igual (em C)

-- troca o CPF abaixo pelo CPF do proprietário que quer consultar
WHERE P.cpf = '11122233344';

-- B) Consultar proprietário(s) por qualquer parte do nome;
SELECT * FROM PROPRIETARIO

-- troque silva pelo nome (ou parte do nome) que quer buscar
WHERE nome LIKE '%Silva%';

-- C) Mostrar os dados da infração e do veículo que tiveram infrações cadastradas 
-- no Detran em um período (ou data) no padrão DE... ATÉ...;
SELECT
    I.idInfracao,
    I.dataHora,
    I.velocidadeAferida,
    L.velocidadePermitida,
    V.placa,
    M.nomeModelo AS nome_do_modelo,
    TI.descricaoInfracao AS tipo_de_infracao,
    TI.valor AS valor_da_multa

FROM INFRACAO AS I

JOIN VEICULO AS V ON I.FK_VEICULO_placa = V.placa -- conecta pela placa

JOIN TIPOINFRACAO AS TI ON I.FK_TIPOINFRACAO_numeroInfracao = TI.numeroInfracao -- conecta pelo número da infração

JOIN LOCAL AS L ON I.FK_LOCAL_latitudeLongitude = L.latitudeLongitude -- conecta pela latitude/longitude

JOIN tem_VEICULO_MODELO_CATEGORIA AS T ON V.placa = T.fk_VEICULO_placa

JOIN MODELO AS M ON T.fk_MODELO_numeroModelo = M.numeroModelo

WHERE
    I.dataHora BETWEEN '2023-10-01 00:00:00' -- data de início
    AND '2023-10-10 23:59:59'; -- data de fim

-- D) Pesquisar o número de veículos que foram cadastrados em cada modelo,
-- ordenando pelo número de veículos em ordem decrescente;

SELECT M.nomeModelo AS nome_do_modelo,

COUNT(T.fk_VEICULO_placa) AS quantidade_de_veiculos

FROM MODELO AS M

LEFT JOIN tem_VEICULO_MODELO_CATEGORIA AS T ON M.numeroModelo = T.fk_MODELO_numeroModelo

GROUP BY M.nomeModelo

ORDER BY quantidade_de_veiculos DESC;