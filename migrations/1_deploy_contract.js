const { artifacts } = require("@truffle/artifacts");
const MiniNFTGame = artifacts.require("MiniNFTGame"); //json file

module.exports = function (deployer) {
  deployer.deploy(MiniNFTGame);
};
