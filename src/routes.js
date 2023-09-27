const express = require("express");
const router = express.Router();

const ImovelController = require("./controllers/ImovelController");

router.get("/imoveis", ImovelController.buscarTodos);
router.get("/imoveis/ocorrencias", ImovelController.mostrarOcorrencias);
router.get("/imoveis/detalhes", ImovelController.mostrarDetalhesImoveis);
router.get(
  "/imoveis/percentualvendas",
  ImovelController.mostrarPercentualVendas
);

module.exports = router;
