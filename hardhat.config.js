require("@nomicfoundation/hardhat-toolbox");

require("hardhat-gas-reporter");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    
    bnbtestnet: {
      url: "https://tiniest-newest-spring.bsc-testnet.quiknode.pro/fac408fccd6bf2b3cf49b905f99b4be53c84f89d/", //RPC from my quicknode
      accounts: ["819de9a55198a799c69a67a2bae46e5ce775dde0c7ac73df73a972584d7aa61f"],
      chainId: 97,
    },
  },
  etherscan: {
    apiKey: "YPJ8ZZ66IWNIHMDNFRBBJD4DFD378G4BBE", // your Etherscan API key
  },

};