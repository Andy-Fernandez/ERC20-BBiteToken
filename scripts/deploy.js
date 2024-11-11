const { ethers } = require("hardhat");

async function main() {
  const BBitesToken = await ethers.getContractFactory("BBitesToken");
  console.log("Desplegando BBitesToken...");
  const bbitesToken = await BBitesToken.deploy();
  await bbitesToken.deployed();
  console.log("BBitesToken desplegado en:", bbitesToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
