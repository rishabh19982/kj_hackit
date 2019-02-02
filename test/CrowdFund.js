var CrowdFund = artifacts.require("./CrowdFund.sol");

contract('CrowdFund', function(accounts) {
	var CrowdFundInstance;
	var buyerAddress=0x57C13329C1DA369A0aEdE92687a32df7791dAE4E;
	var senderAddress=0xD1b67d43275A97Fbe19Efac7797DFEae3ff682b0;
	it('checks the buyer and sender addresses', function() {
		return CrowdFund.deployed().then(function(instance) {
			CrowdFundInstance = instance;
			// Test `require` statement first by transferring something larger than the sender's balance
			return CrowdFundInstance.buyer();
		}).then(function(buyer) {
			assert(buyer,buyerAddress, 'buyer address is verfied');
			return CrowdFundInstance.seller();
		}).then(function(sender) {
			assert(sender,senderAddress,'sender also verified');
		});
	});
	it('checks the accept and cancel functions',function(instance){
		return CrowdFund.deployed().then(function(instance))
	});
});