var CrowdFund = artifacts.require("./CrowdFund.sol");
var buyerAddr='0x57C13329C1DA369A0aEdE92687a32df7791dAE4E';
var senderAddr='0xD1b67d43275A97Fbe19Efac7797DFEae3ff682b0';
module.exports = function(deployer) {
	deployer.deploy(CrowdFund,buyerAddr,senderAddr);
};