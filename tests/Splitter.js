const Splitter = artifacts.require("./Splitter.sol");

contract('Splitter', accounts => {

	console.log(accounts);

	it("should split input of 50 equally", function() {
		var accountAlice = accounts[0];
		var accountBob = accounts[1];

		let instance;
		return Splitter.deployed()
			.then(_instance => {
				instance = _instance;
				return instance.splitFunds.sendTransaction( {value: 50, from: accountAlice } );
			})
			.then(success => {
				assert.equal(accountBob.value, 25, "split failed!")
			});
	});
});
