const ImovelService = require("../services/ImovelService");

module.exports = {
  buscarTodos: async (req, res) => {
    let json = { error: "", result: [] };
    let imoveis = await ImovelService.buscarTodos();

    for (let i in imoveis) {
      json.result.push({
        id: imoveis[i].id,
        descricao: imoveis[i].descricao,
        tipoImovel: imoveis[i].tipoImovel,
      });
    }
    res.json(json);
  },
  mostrarDetalhesImoveis: async (req, res) => {
    let json = { error: "", result: [] };
    let imoveis = await ImovelService.mostrarDetalhesImoveis();

    for (let i in imoveis) {
      json.result.push({
        id: imoveis[i].id,
        totalVenda: imoveis[i].totalVenda,
      });
    }
    res.json(json);
  },
  mostrarOcorrencias: async (req, res) => {
    let json = { error: "", result: [] };
    let ocorrencia = await ImovelService.mostrarOcorrencias();

    for (let i in ocorrencia) {
      json.result.push({
        mesAno: ocorrencia[i].mesAno,
        totalVendas: ocorrencia[i].totalVendas,
      });
    }
    res.json(json);
  },
  mostrarPercentualVendas: async (req, res) => {
    let json = { error: "", result: [] };
    let percentualVendas = await ImovelService.mostrarPercentualVendas();

    for (let i in percentualVendas) {
      json.result.push({
        tipoImovel: percentualVendas[i].tipoImovel,
        percentualVendas: percentualVendas[i].percentualVendas + "%",
      });
    }
    res.json(json);
  },
};
