const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "METAMASK_MNEMONIC";

module.exports = {
  networks: {
    sepolia: {
      provider: () =>
        new HDWalletProvider(mnemonic, "https://sepolia.net/testnet"),
      network_id: "*",
      gas: 8000000,
      gasPrice: 10000000000,
    },
  },
  compilers: {
    solc: {
      version: "^0.8.1",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
};
