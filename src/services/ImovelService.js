const db = require("../db");

module.exports = {
  buscarTodos: () => {
    return new Promise((aceito, rejeitado) => {
      db.query("SELECT * FROM imovel", (error, results) => {
        if (error) {
          rejeitado(error);
          return;
        }
        aceito(results);
      });
    });
  },
  mostrarDetalhesImoveis: () => {
    return new Promise((aceito, rejeitado) => {
      db.query(
        `SELECT i.id, SUM(v.valorPagamento) AS totalVenda
      FROM imovel i
      INNER JOIN venda v ON i.id = v.id_imovel
      GROUP BY i.id`,
        (error, results) => {
          if (error) {
            rejeitado(error);
            return;
          }
          aceito(results);
        }
      );
    });
  },
  mostrarOcorrencias: () => {
    return new Promise((aceito, rejeitado) => {
      db.query(
        `
      SELECT DATE_FORMAT(dataPagamento, '%Y-%m') AS mesAno, SUM(valorPagamento) AS totalVendas
      FROM venda
      GROUP BY mesAno
      `,
        (error, results) => {
          if (error) {
            rejeitado(error);
            return;
          }
          aceito(results);
        }
      );
    });
  },
  mostrarPercentualVendas: () => {
    return new Promise((aceito, rejeitado) => {
      db.query(
        `SELECT 
      i.tipoImovel, 
      COUNT(v.id) AS totalVendas,
      (COUNT(v.id) / (SELECT COUNT(*) FROM venda)) * 100 AS percentualVendas
  FROM 
      imovel i
  INNER JOIN 
      venda v ON i.id = v.id_imovel
  GROUP BY 
      i.tipoImovel`,
        (error, results) => {
          if (error) {
            rejeitado(error);
            return;
          }
          aceito(results);
        }
      );
    });
  },
};
