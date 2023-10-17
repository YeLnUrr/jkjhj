const hre = require("hardhat");

async function main() {
  const [owner] = await ethers.getSigners();

  const Token = await hre.ethers.getContractFactory("NFT");
  const token = await Token.deploy();
  await token.deployed();

  console.log(`Token deployed to address: ${token.address}`);

  console.log(`Minting tokens...`);
  const mintTx = await token.safeMint(owner.address, { value: ethers.utils.parseEther("0.001") });
  await mintTx.wait();

  console.log(`Tokens minted successfully.`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
