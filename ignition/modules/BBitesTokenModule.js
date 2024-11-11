const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const BBitesTokenModule = buildModule("BBitesTokenModule", (m) => {
  // Desplegar el contrato BBitesToken
  const bbitesToken = m.contract("BBitesToken");

  return { bbitesToken };
});

module.exports = BBitesTokenModule;
