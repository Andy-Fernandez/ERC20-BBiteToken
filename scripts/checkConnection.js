const { ethers } = require("hardhat");

async function main() {
  const latestBlock = await ethers.provider.getBlockNumber();
  console.log("Conectado correctamente. Último bloque en Sepolia:", latestBlock);
}

main().catch((error) => {
  console.error("Error en la conexión:", error);
  process.exitCode = 1;
});

